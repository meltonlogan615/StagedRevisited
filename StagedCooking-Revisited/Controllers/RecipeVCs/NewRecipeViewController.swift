//
//  NewRecipeViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

import UIKit

class NewRecipeViewController: UIViewController {
  
  let dataprovider = DataProvider()
  let recipeView = NewRecipeView()
  
  // Recipe
  var recipe = Recipe()
  var recipeID = 0
  
  // Ingredients
  var extendedIngredients = [ExtendedIngredient]()
  var ingredientList = [String]()
  var stepIngredients = [Int: [String]]()
  
  // Instructions
  var instructions = Instructions()
  var instructionsList = [String]()
  var stepInstructions = [Int: String]()
  
  var macros = [Macros]()
  var generalInfo: GeneralInfo?
  var dietInfo: DietInfo?
  
  var recipeTitle = String()
  var summary = String()
  var nutrition = [String]()
  var startCookingButton = UIButton()
  
  override func viewWillAppear(_ animated: Bool) {
    loadRecipeByID(for: recipeID) // Gets the Data for the Recipe. Also generates data for ingredientList
    getInstructions(for: recipeID) // Generates stepIngredients & stepInstructions
    style()
    layout()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "SC-Primary")
    self.ingredientList = [String]()
    
    recipeView.showGeneralButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showIngredientsButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showSummaryButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showNutritionButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showRestrictionsButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    
    startCookingButton.addTarget(self, action: #selector(startCookingButtonTapped), for: .primaryActionTriggered)
  }
}

// MARK: - Button Actions
extension NewRecipeViewController: ModalDataSource {
  @objc func showModal(_ sender: UIButton) {
    guard let senderTitle = sender.currentTitle else { return }
    let modal = ModalViewController()
    modal.modalPresentationStyle = .overFullScreen
    
    switch senderTitle {
      case "General":
        modal.labelText = "General"
        guard let generalInfo = self.generalInfo else { break }
        let generalModal = GeneralModal(info: generalInfo)
        modal.modalView = generalModal
        present(modal, animated: true)

        
      case "Ingredients":
        modal.labelText = "Ingredients"
        let ingredientsModal = IngredientsModal(ingredients: self.ingredientList)
        modal.modalView = ingredientsModal
        present(modal, animated: true)
        
      case "Summary":
        modal.labelText = "Summary"
        let summaryModal = SummaryModal(summary: self.summary)
        modal.modalView = summaryModal
        present(modal, animated: true)
        
      case "Nutrition":
        modal.labelText = "Nutrition"
        let macrosModal = MacrosModal(macros: self.macros)
        modal.modalView = macrosModal
        present(modal, animated: true)
        
      case "Diets":
        modal.labelText = "Diets"
        guard let diets = self.dietInfo else { return }
        let dietsModal = DietsModal(info: diets)
        print(diets)
        modal.modalView = dietsModal
        print("click")
        present(modal, animated: true)

      default:
        print("nope")
    }
  }
  
  @objc func startCookingButtonTapped(_ sender: UIButton) {
    let stagesVC = StagedCardContainerViewController()
    let cards = buildCards(ingredients: ingredientList, instructionsDictionary: stepInstructions, ingredientDictionary: stepIngredients)
    stagesVC.recipe = recipe
    stagesVC.cards = cards
    stagesVC.ingredientList = self.ingredientList
    navigationController?.pushViewController(stagesVC, animated: true)
  }
}

// MARK: - Style & Layout
extension NewRecipeViewController {
  func style() {
    recipeView.translatesAutoresizingMaskIntoConstraints = false
    recipeView.titleLabel.text = self.recipeTitle
    recipeView.layer.zPosition = 1
    
    startCookingButton.translatesAutoresizingMaskIntoConstraints = false
    startCookingButton.setTitle("Start Cooking", for: .normal)
    startCookingButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    startCookingButton.backgroundColor = UIColor(named: "SC-Green")
    startCookingButton.layer.zPosition = 10
    startCookingButton.layer.cornerRadius = 8
    startCookingButton.clipsToBounds = true
  }
  
  func layout() {
    view.addSubview(recipeView)
    NSLayoutConstraint.activate([
      recipeView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: recipeView.trailingAnchor, multiplier: 4),
      recipeView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4)
    ])
    
    view.addSubview(startCookingButton)
    NSLayoutConstraint.activate([
      startCookingButton.heightAnchor.constraint(equalToConstant: 48),
      startCookingButton.leadingAnchor.constraint(equalTo: recipeView.leadingAnchor),
      startCookingButton.trailingAnchor.constraint(equalTo: recipeView.trailingAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: startCookingButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6)
    ])
  }
}

// MARK: - loadRecipe Method - Get Recipe Information and create an array from Recipe.extendedIngrediets property
extension NewRecipeViewController: RecipeByID {
  func loadRecipeByID(for selectedRecipe: Int) {
    dataprovider.getRecipeByID(for: selectedRecipe) { [weak self] (foodResult: Result<Recipe, Error>) in
      guard let self = self else { return }
      switch foodResult {
        case .success(let model):
          DispatchQueue.main.async { [self] in
            guard let selectedRecipe = model as Recipe? else { return }
            self.setProperties(for: selectedRecipe)
          }
        case .failure(let error):
          print("recipe error:", error)
      } // End of Switch
    }
  }
} // END of Extension

// MARK: - setProperties Method, receives data, unwraps and sends to the view to display
extension NewRecipeViewController {
  func setProperties(for selectedRecipe: Recipe) {
    self.recipe = selectedRecipe
    guard let title = selectedRecipe.title else { return }
    self.recipeTitle = title
    guard let image = selectedRecipe.image else { return }
    self.recipeView.mainImage.loadImage(url: image)
    
    generateGeneralInfo(for: selectedRecipe)
    generateIngredientsList(for: selectedRecipe)
    generateSummary(for: selectedRecipe)
    generateMacrosModel(for: selectedRecipe)
    generateDietsInfo(for: selectedRecipe)
  }
}



