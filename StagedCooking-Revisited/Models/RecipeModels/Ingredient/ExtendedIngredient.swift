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
  var aisle: String?
  var amount: Double?
  var consistency: String?
  var id: Int?
  var image: String?
  var measures: Measures?
  var meta: [String]?
  var name: String?

  var nameClean: String?
  var original: String?
  var originalName: String?
}

struct Measures: Codable, Hashable {
  var metric, us: Unit?
}

struct Unit: Codable, Hashable {
  var amount: Double?
  var unitLong: String?
  var unitShort: String?
}
