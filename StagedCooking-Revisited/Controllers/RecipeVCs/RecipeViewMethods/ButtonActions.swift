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
  /// Creates the `Card`s that will be used in the `StagedCardContainerViewController`, and then presents the Container
  @objc func startCookingButtonTapped(_ sender: UIButton) {
    let cards = buildCards(ingredients: ingredientList, instructionsDictionary: stepInstructions, ingredientDictionary: stepIngredients)
    let stagesVC = StagedCardContainerViewController()

//    For Debugging purposes if cards are not generated correctly:
//    print("Ingredients, \n", ingredientList)
//    print("\n Instructions: \n", stepInstructions)
//    print("\n Step Ingredients: \n", stepIngredients)
    print(cards)
    stagesVC.recipe = recipe
    stagesVC.cards = cards
    stagesVC.ingredientList = self.ingredientList
    navigationController?.pushViewController(stagesVC, animated: true)
  }
  
  // MARK: - Save Recipe for Later
  @objc func saveRecipe() {
    // need to show to chef that recipe has been saved
    ChefDefault.addToSaved(recipeID: String(recipeID), recipeTitle: recipeTitle)
    self.setRightBarButtons()
  }
  
  @objc func favRecipe() {
    ChefDefault.favoriteRecipes[String(recipeID)] = recipeTitle
    self.setRightBarButtons()
  }
}
