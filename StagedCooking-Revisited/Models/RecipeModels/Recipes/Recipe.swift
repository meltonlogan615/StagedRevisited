//
//  Recipe.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

struct Recipe: Decodable, Identifiable {
  
  // Basics
  var id: Int?
  var title: String?
  var image: String?
  var imageType: String?
  var instructions: String?

  var extendedIngredients: [ExtendedIngredient]?
  
  var summary: String?
  
//  RecipeModal Health Values
  var dishTypes: [String]?
  var cuisines: [String]?
  var servings: Int?
  var readyInMinutes: Int?
  var veryPopular: Bool?
  var sustainable: Bool?
  var cheap: Bool?
  var pricePerServing: Double?
  
//  RecipeModal Health Values
  var nutrition: Nutrition?
  var veryHealthy: Bool?
  var healthScore: Int?
  var weightWatcherSmartPoints: Int?
  var whole30: Bool?

  // Allergens Missing??
//  var allergens: [String]?
  var diets: [String]? // May need to be updated to dedicated type
  var vegan: Bool?
  var vegetarian: Bool?
  var dairyFree: Bool?
  var glutenFree: Bool?
  var ketogenic: Bool?
  var lowFodmap: Bool?
  
  //  Unused
//  var license, sourceName: String?
//  var sourceURL: String?
//  var spoonacularSourceURL: String?
//  var aggregateLikes: Int?
//  var spoonacularScore: Int?
  //    var analyzedInstructions: [JSONAnyQ]?
//  var creditsText: String?
//  var gaps: String?
    //    var occasions: [JSONAnyQ]?
//  var winePairing: WinePairing?
}
