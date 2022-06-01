//
//  DietsInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
/**
 Struct for information relating to `Diet` enum.
 
 Data is generated in `RecipeViewController` and it's extension `GenerateDietsInfo`.
 
 Passed into `DietsModal` and used to populate the `.text` properties of the  `SCLabel`.
 */
struct DietInfo: Codable {
  var diets: String
  var whole30: String
  var vegan: String
  var vegetarian: String
  var dairyFree: String
  var glutenFree: String
  var keto: String
  var lowFodmap: String
  var veryHealthy: String
  var healthScore: String
  var wwSmartPoints: String
}
