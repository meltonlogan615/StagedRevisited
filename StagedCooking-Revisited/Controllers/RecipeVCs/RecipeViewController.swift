//
//  RecipeViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

import UIKit
/**
 Main `ViewController` for the `Recipe`
 
 Is also the launching point for when `Card`s are built.
 
 See RecipeViewMethods/DataGeneration for View's Content and Button Actions.
 */
class RecipeViewController: UIViewController {
  
  let dataprovider = DataProvider()
  var recipeView = RecipeView()
  
  // Recipe
  var recipe = Recipe()
  var recipeID = 0
    
  // General Info
  var recipeTitle = String()
  var summary = String()
  var nutrition = [String]()
  
  // Ingredients
  var extendedIngredients = [ExtendedIngredient]()
  var ingredientList = [String]()
  var stepIngredients = [Int: [String]]()
  
  // Instructions
  var instructions = Instructions()
  var instructionsList = [String]()
  var stepInstructions = [Int: String]()
  
  // Macronutrients
  var macros = [Macros]()
  var generalInfo: GeneralInfo?
  var dietInfo: DietInfo?
  
  // Start Cooking
  var startCookingButton = UIButton()
  
  override func viewWillAppear(_ animated: Bool) {
    // Gets the Data for the Recipe. Also generates data for ingredientList
    loadRecipeByID(for: recipeID)
    // Generates stepIngredients & stepIngredients
    getInstructions(for: recipeID)
    navigationController?.navigationBar.prefersLargeTitles = false
    // TODO: - #29 - ADD RightBarButtonItem to dismiss views back to SearchVC
    style()
    layout()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    activateButtons()
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

// MARK: - loadRecipe Method -
extension RecipeViewController: RecipeByID {
  /// Gets `Recipe` Information and create an array from `Recipe.extendedIngrediets` property
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

