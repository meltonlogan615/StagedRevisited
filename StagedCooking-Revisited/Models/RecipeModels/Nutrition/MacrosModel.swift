//
//  MacrosModel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/10/22.
//

import Foundation
/**
 Will be passed into `MacrosModal` as a DataType for  `MacrosModal.macros` property.
 
 - Data is populated within the `generateMacros(for selectedRecipe: Recipe)` method, which is an extention of `RecipeViewController`.
 - Is oddly one of the only DataTypes that is not encumbered by all properties being `optional`
 */
struct Macros: Codable {
  var name: String
  var amount: Double
  var unit: String
  var percentOfDailyNeeds: Double
}
