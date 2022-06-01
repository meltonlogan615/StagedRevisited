//
//  ExtendedIngredient.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
/**
 
 DataType for `ExtendedIngredient`..
 
 Is currently used as:
  - value for `extendedIngredients` property in `Recipe`.
  - value for `extendedIngredients` property in `RecipeViewController`.
  - value in `generateIngredientsList(for selectedRecipe: Recipe)` to create `ingredientsList`.
 */
struct ExtendedIngredient: Codable, Hashable, Identifiable {
  var id: Int? 
  var name: String?
  var aisle: String?
  var image: String?
  var amount: Double?
  var consistency: String? 
  var meta: [String]?

  var nameClean: String?
  var original: String?
  var originalName: String?
}
