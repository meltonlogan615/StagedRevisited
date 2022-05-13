//
//  CardBuilder.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit

// MARK: - Build Cards
extension NewRecipeViewController: CardBuilder {
  func buildCards(ingredients: [String], instructionsDictionary: [Int: String], ingredientDictionary: [Int: [String]]) -> [Card]{
    var cards = [Card]()
    // Sort Dictionaries bu their IDs
    let sortedInstructions = instructionsDictionary.sorted(by: { $0.key < $1.key } )
    let sortedIngredients = ingredientDictionary.sorted(by: { $0.key < $1.key } )
    var cabinet = ingredients // need mutable [String]
    
    var cardNumber = 0
    
    // iterate through instructions dictionary
    for (instructionsKey, instructionsValue) in sortedInstructions {
      
      cardNumber = instructionsKey
      
      // iterate through ingredients dictionary
      for (ingredientKey, ingredientValue) in sortedIngredients {
        
        // if keys match
        if instructionsKey == ingredientKey {
          var mixingBowl = [String]()
          // iterate through ingredientDictionary values array
          for i in 0 ..< ingredientValue.count {
            
            // iterate through ingredients array
            for j in 0 ..< cabinet.count {
              
              // if value from ingredientDictionary is found in the ingredient string
              if cabinet[j].contains(ingredientValue[i]) {
                mixingBowl.append(cabinet[j])
                cabinet[j] = ""
              }
              
            }
          }
          //  Build the cards from the parameters passed in
          let card = Card(id: cardNumber, ingredients: mixingBowl, instructions: instructionsValue)
          cards.append(card)
        }
      }
    }
    //    cards = cards.sorted() // sorts by id, aka card number, aka step number
    return cards.sorted()  // sorts by id, aka card number, aka step number
  }
}
