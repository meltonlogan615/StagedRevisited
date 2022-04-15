//
//  Recipe.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

struct Recipe: Decodable, Identifiable, Hashable {
  var id: Int?
  var title: String?
  var image: String?
  var imageType: String?
  var servings: Int?
  var readyInMinutes: Int?
  var license, sourceName: String?
  var sourceURL: String?
  var spoonacularSourceURL: String?
  var aggregateLikes, healthScore, spoonacularScore: Int?
  var pricePerServing: Double?
  //    var analyzedInstructions: [JSONAnyQ]?
  var cheap: Bool?
  var creditsText: String?
  //    var cuisines: [JSONAnyQ]?
  var dairyFree: Bool?
  //  var diets: [JSONAnyQ]?
  var gaps: String?
  var glutenFree: Bool?
  var instructions: String?
  var ketogenic, lowFodmap: Bool?
    //    var occasions: [JSONAnyQ]?
  var sustainable, vegan, vegetarian, veryHealthy: Bool?
  var veryPopular, whole30: Bool?
  var weightWatcherSmartPoints: Int?
  var dishTypes: [String]?
  var extendedIngredients: [ExtendedIngredient]?
  var summary: String?
////  var winePairing: WinePairing?
//
  static func < (lhs: Self, rhs: Self) -> Bool {
    var result = false
    if let leftTitle = lhs.title {
      if let rightTitle = rhs.title {
        result = leftTitle < rightTitle
      }
    }
    return result
  }
}
