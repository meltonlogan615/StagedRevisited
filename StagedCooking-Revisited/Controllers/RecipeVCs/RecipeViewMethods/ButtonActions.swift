//
//  ButtonActions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/8/22.
//

import Foundation
import UIKit

// MARK: - Button Activation
extension RecipeViewController {
  func activateButtons() {
    /// Modal Views
    recipeView.showIngredientsButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    
    recipeView.showSummaryButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    
    recipeView.showNutritionButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    
    recipeView.showRestrictionsButton.addTarget(self, action: #selector(showModal), for: .primaryActionTriggered)
    
    /// Begins the Card Building process below
    startCookingButton.addTarget(self, action: #selector(startCookingButtonTapped), for: .primaryActionTriggered)
  }
}

// MARK: - Detail Buttons
extension RecipeViewController: ModalDataSource {
  enum Sender: String, CaseIterable {
    case ing, sum, mac, die
  }
  
  @objc func showModal(_ sender: UIButton) {
    guard let senderTitle = sender.currentTitle else { return }
    let modal = ModalViewController()
    modal.modalPresentationStyle = .overFullScreen
    
    switch senderTitle {
      case "Ingredients":
        modal.labelText = "Ingredients"
        guard let ingredients = self.ingredientList else { return }
        modal.ingredients = ingredients
        modal.sender = Sender.ing.rawValue
        present(modal, animated: true)
        
      case "Summary":
        modal.labelText = "Summary"
        modal.summary = summary
        modal.sender = Sender.sum.rawValue
        present(modal, animated: true)
        
      case "Nutrition":
        modal.labelText = "Nutrition"
        guard let macros = self.macros else { return }
        modal.macros = macros
        modal.sender = Sender.mac.rawValue
        present(modal, animated: true)
        
      case "Diets":
        modal.labelText = "Diets"        
        guard let diets = self.dietInfo else { return }
        let dietsModal = DietsModal(info: diets)
        modal.modalView = dietsModal
        modal.diets = diets
        modal.sender = Sender.die.rawValue
        present(modal, animated: true)
        
      default:
        print("nope")
    }
  }
  
  // MARK: - Start Cooking Button Pressed
  /// Creates the `Card`s that will be used in the `StagedCardContainerViewController`, and then presents the Container
  @objc func startCookingButtonTapped(_ sender: UIButton) {
    guard let ingredients = ingredientList else { return }
    let cards = buildCards(ingredients: ingredients, instructionsDictionary: stepInstructions, ingredientDictionary: stepIngredients)
    let stagesVC = StagedCardContainerViewController()

    stagesVC.recipe = recipe
    stagesVC.cards = cards
    stagesVC.ingredientList = self.ingredientList
    navigationController?.pushViewController(stagesVC, animated: true)
  }
  
  // MARK: - Save Recipe for Later
  @objc func saveRecipe() {
    // need to show to chef that recipe has been saved
    if ChefDefault.savedRecipes.containsKey(String(recipeID)) {
      ChefDefault.savedRecipes[String(recipeID)] = nil
    } else {
      ChefDefault.addToSaved(recipeID: String(recipeID), recipeTitle: recipeTitle)
    }
    self.setRightBarButtons()
  }
  
  @objc func favRecipe() {
    if ChefDefault.favoriteRecipes.containsKey(String(recipeID)) {
      ChefDefault.favoriteRecipes[String(recipeID)] = nil
    } else {
      ChefDefault.addToFavorites(recipeID: String(recipeID), recipeTitle: recipeTitle)
    }
    self.setRightBarButtons()
  }
}


