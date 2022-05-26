//
//  RecipeViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

import UIKit

class RecipeViewController: UIViewController {
  
  let dataprovider = DataProvider()
  var recipeView = RecipeView()
  
  // Recipe
  var recipe = Recipe()
  var recipeID = 0
  
  // General Info
  
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
    getInstructions(for: recipeID) // Generates stepIngredients &
//    testIdeas()
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search Again",
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(showModal))
    style()
    layout()
    print("List", ingredientList)
    print("Extended", extendedIngredients)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
//    self.ingredientList = [String]()
    
//    recipeView.showGeneralButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showIngredientsButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showSummaryButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showNutritionButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    recipeView.showRestrictionsButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    
    startCookingButton.addTarget(self, action: #selector(startCookingButtonTapped), for: .primaryActionTriggered)
  }
}

// MARK: - Button Actions
extension RecipeViewController: ModalDataSource {
  @objc func showModal(_ sender: UIButton) {
    guard let senderTitle = sender.currentTitle else { return }
    let modal = ModalViewController()
    modal.modalPresentationStyle = .overFullScreen
    
    switch senderTitle {
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
        modal.modalView = dietsModal
        present(modal, animated: true)

      default:
        print("nope")
    }
  }
  
  // MARK: - Start Cooking Button Pressed
  @objc func startCookingButtonTapped(_ sender: UIButton) {
//    let layout = UICollectionViewFlowLayout()
//    layout.scrollDirection = .horizontal
//    let stagesVC = CardCollectionTwo(collectionViewLayout: layout)
    let cards = buildCards(ingredients: ingredientList, instructionsDictionary: stepInstructions, ingredientDictionary: stepIngredients)
    let stagesVC = StagedCardContainerViewController()
    stagesVC.recipe = recipe
    stagesVC.cards = cards
    stagesVC.ingredientList = self.ingredientList
    navigationController?.pushViewController(stagesVC, animated: true)
  }
}

// MARK: - Style & Layout
extension RecipeViewController {
  func style() {
    recipeView.translatesAutoresizingMaskIntoConstraints = false
    recipeView.titleLabel.text = self.recipeTitle
    recipeView.layer.zPosition = 1
        
    startCookingButton.translatesAutoresizingMaskIntoConstraints = false
    startCookingButton.setTitle("Start Cooking", for: .normal)
    startCookingButton.backgroundColor = K.scGreen
    startCookingButton.layer.zPosition = 10
    startCookingButton.layer.cornerRadius = 8
    startCookingButton.clipsToBounds = true
  }
  
  func layout() {
    
    view.addSubview(recipeView)
    NSLayoutConstraint.activate([
      recipeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      recipeView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: recipeView.trailingAnchor, multiplier: 4),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: recipeView.safeAreaLayoutGuide.bottomAnchor, multiplier: 13),
    ])
    
    view.addSubview(startCookingButton)
    NSLayoutConstraint.activate([
      startCookingButton.heightAnchor.constraint(equalToConstant: 48),
      startCookingButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: startCookingButton.trailingAnchor, multiplier: 4),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: startCookingButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6)
    ])
  }
}

// MARK: - loadRecipe Method - Get Recipe Information and create an array from Recipe.extendedIngrediets property
extension RecipeViewController: RecipeByID {
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
extension RecipeViewController {
  func setProperties(for selectedRecipe: Recipe) {
    self.recipe = selectedRecipe
    
    guard let image = selectedRecipe.image else { return }
    self.recipeView.mainImage.loadImage(url: image)
    
    guard let title = selectedRecipe.title else { return }
    self.recipeTitle = title
    
    guard let totalTime = selectedRecipe.readyInMinutes else { return }
    self.recipeView.readyInMinutesLabel.text = "⏲ 🟰 \(totalTime) minutes"
    
//    guard let calories = selectedRecipe.nutrition?.caloricBreakdown else { return }
//    self.recipeView.caloriesLabel.text = "\(calories) Per Serving"
    guard let servings = selectedRecipe.servings else { return }
    self.recipeView.servingsLabel.text = "👤 🟰 \(servings)"

    
    if let dishType = selectedRecipe.dishTypes {
      var dishText = String()
      // Formatting the string to be passed as the label text
      if !dishType.isEmpty {
        for i in 0 ..< dishType.count {
          if dishType.count == 1 {
            dishText = dishType[i].capitalized
          } else if dishType[i] == dishType.last {
            dishText += "or \(dishType[i].capitalized)"
          } else {
            dishText += "\(dishType[i].capitalized), "
          }
        }
        self.recipeView.dishTypeLabel.text = "👍 🟰 \(dishText)"
      }
    }
    
    if let cuisines = selectedRecipe.cuisines {
      var string = String()
      // Formatting the string to be passed as the label text
      for i in 0 ..< cuisines.count {
        if cuisines[i] == cuisines.last {
          string += cuisines[i]
        } else {
          string += "\(cuisines[i]), "
        }
      }
      switch cuisines.count {
        case 0:
          break
        case 1:
          self.recipeView.cuisinesLabel.text = "Cuisine: \(string)"
        default:
          self.recipeView.cuisinesLabel.text = "Cuisines: \(string)"
      }
    }
    
    if let popular = selectedRecipe.veryPopular {
      if popular {
        self.recipeView.veryPopularLabel.text = "Very Popular"
      }
    }
    
    if let sustainable = selectedRecipe.sustainable {
      if sustainable {
        self.recipeView.sustainableLabel.text = "🌱 Sustainable Recipe 🌱"
        self.recipeView.sustainableLabel.tintColor = .green
      }
    }

    generateIngredientsList(for: selectedRecipe)
    generateSummary(for: selectedRecipe)
    generateMacrosModel(for: selectedRecipe)
    generateDietsInfo(for: selectedRecipe)
  }
}

// MARK: - For Testing UI

//extension RecipeViewController {
//  func testIdeas() {
//    let cuisineA = Cuisine.american.rawValue
//    let cuisineB = Cuisine.cajun.rawValue
//    let cuisineC = Cuisine.easternEuropean.rawValue
//    let cuisines = "\(cuisineA), \(cuisineB), \(cuisineC)"
//    let totalTime = 50
//    let dishText = "breakfast, lunch, snack"
//    let servings = 50
//
//    self.recipeView.mainImage.image = UIImage(named: "hotchiken")
//    self.recipeTitle = "POŒPPPP"
//    self.recipeView.readyInMinutesLabel.text = "⏲ 🟰 \(totalTime) minutes"
//    self.recipeView.dishTypeLabel.text = "👍 🟰 \(dishText)"
//    self.recipeView.cuisinesLabel.text = "\(cuisines)"
//  }
//}

