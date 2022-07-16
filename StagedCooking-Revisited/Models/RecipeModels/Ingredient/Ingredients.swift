//
//  Ingredient.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
/**
 DataType for `Ingredient`..
 
 Not currently in use..
 */
struct Ingredients: Codable, Hashable {
  var ingredients = [ExtendedIngredient]()
  
  init(from recipe: Recipe) {
    guard let ingredients = recipe.extendedIngredients else { return }
    self.ingredients = ingredients
  }
  
  init() {
    self.ingredients = []
  }
}

