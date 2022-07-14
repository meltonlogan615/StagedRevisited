//
//  CardBuilder.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit

// MARK: - Build Cards
extension RecipeViewController: CardBuilder {
  /**
   The main driving method. Is the main algorithm that drives the purpose of this app.
   
   Takes the following parameters:
   - `ingredients: [String]`
   - `instructionsDictionary: [Int: String]`
   - `ingredientDictionary: [Int: [String]]`
   
   `Ingredients` comes from the `generateIngredientsList(for selectedRecipe: Recipe)` method that is an extension of `RecipeViewController`
   - ~/VCMethods/RecipeViewMethods/DataGeneration/GenerateIngredientsList
   
   `InstructionsDictionary` &  `ingredientDictionary` both come from the `getInstructions(for selectedsRecipe: Int)` method that is an extension of `RecipeViewController`
   - ~/VCMethods/RecipeViewMethods/DataGeneration/GetInstructions
   
   */
  func buildCards(ingredients: Ingredients, instructionsDictionary: [Int: String], ingredientDictionary: [Int: [String]]) -> [Card]{
    var cards = [Card]()
    // Sort Dictionaries bu their IDs
    let sortedInstructions = instructionsDictionary.sorted(by: { $0.key < $1.key } )
    let sortedIngredients = ingredientDictionary.sorted(by: { $0.key < $1.key } )
    var cabinet = ingredients.ingredients // need mutable [String]
    
    var cardNumber = 0
    
    // iterate through instructions dictionary
    for (instructionsKey, instructionsValue) in sortedInstructions {
      
      cardNumber = instructionsKey
      
      // iterate through ingredients dictionary
      for (ingredientKey, ingredientValue) in sortedIngredients {
        
        // if keys match
        if instructionsKey == ingredientKey {
          var mixingBowl = ingredients
          // iterate through ingredientDictionary values array
          for i in 0 ..< ingredientValue.count {
            
            // iterate through ingredients array
            for j in 0 ..< cabinet.count {
              if let name = cabinet[j].nameClean {
                // if value from ingredientDictionary is found in the ingredient string
                if name.lowercased().contains(ingredientValue[i].lowercased()) {
                  mixingBowl.ingredients.append(cabinet[j])
                  cabinet.remove(at: j)
                }
                
              }
              
            }
          }
          //  Build the cards from the parameters passed in
          let card = Card(id: cardNumber, ingredients: mixingBowl, instructions: instructionsValue)
          cards.append(card)
        }
      }
    }
    return cards.sorted()  // sorts by id, aka card number, aka step number
  }
}
