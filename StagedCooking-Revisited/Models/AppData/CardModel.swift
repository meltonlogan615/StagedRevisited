//
//  CardModel .swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation
/**
 DataType for `Card`.
 
 The main component for this app.
 
 The result of `buildCards(ingredients: [String], instructionsDictionary: [Int: String], ingredientDictionary: [Int: [String]]) -> [Card]` method in `RecipeViewController`.

 */
struct Card: Codable, Identifiable, Comparable, Hashable {
  var id: Int
  var ingredients: [String]
  var instructions: String
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.id < rhs.id
  }
}
