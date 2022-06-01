//
//  GetInstructions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit

// MARK: - Get the instructions and create a dictionary [Step.Number(Int): Step.StepInstructions(String)]
extension RecipeViewController {
  func getInstructions(for selectedsRecipe: Int) {
    dataprovider.getInstructionsByID(for: selectedsRecipe) { [weak self] (analyzedInstructions: Result<[Instructions], Error>) in
      guard let self = self else { return }
      switch analyzedInstructions {
        case .success(let model):
          
          guard let analyzedInstructions = model as [Instructions]? else { return }
          guard let recipeSteps = analyzedInstructions[0].steps as [Step]? else { return }
          
          let sortedSteps = recipeSteps.sorted()
          for stepNumber in 0 ..< sortedSteps.count {
            
            // MARK: - Instructions Dictionary - `stepInstructions`
            if let number = sortedSteps[stepNumber].number {
              if let step = sortedSteps[stepNumber].step {
                self.stepInstructions[number] = step
              }
              
              // MARK: - Ingredients Dictionary - `stepIngredients` - ERROR PRONE
              guard let analyzedIngredients = sortedSteps[stepNumber].ingredients as [StepIngredient]? else { return }
              var shortIngredients = [String]()
              for i in 0 ..< analyzedIngredients.count {
                guard let shortName = analyzedIngredients[i].name else { return }
                switch analyzedIngredients.count {
                  case 0:
                    continue
                  default:
                    shortIngredients.append(shortName)
                }
              }
              self.stepIngredients[number] = shortIngredients
            } // end of number loop
          }// end of step loop
        case .failure(let error):
          print("\nAnalyzed Error:\n", error)
          
      }
    }
  }
} // END of Extension
