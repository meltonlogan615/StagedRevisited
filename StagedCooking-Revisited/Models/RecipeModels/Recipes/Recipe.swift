//
//  Recipe.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
/**
 This DataType  is the backbone of the entire application. Majority of the data used is a direct instationation of `Recipe`.
 
 - Used as an `optional` DataType within `ChefDefaults` as array values for the properties `favoriteRecipes` and `savedRecipes`and their associated static methods.
 - Passed as a property in `RecipeViewController` where it is parsed into seperate sub-categories to make viewing the information more logical and easier to understand.
 - `RecipeViewController` Is used within `loadRecipeByID(for selectedRecipe: Int)` to downcast the successful `Result`into a useful DataType.
 - `RecipeViewController` is the DataType for `setProperties(for selectedRecipe: Recipe)` to parse the successful `Result`.
 
 Is used as the DataType of the arguments passed into the following additional methods on `RecipeViewController`:
  - `generateIngredientsList(for selectedRecipe: Recipe)`
  - `generateSummary(for selectedRecipe: Recipe)`
  - `generateMacrosModel(for selectedRecipe: Recipe)`
  - ` generateDietsInfo(for selectedRecipe: Recipe)`
 
 Is again passed from `RecipeViewController` as a property within `StagedCardContainerViewController`
 */
struct Recipe: Decodable, Identifiable, Comparable {
  
  // Basics
  var id: Int?
  var title: String?
  var image: String?
  var imageType: String?
  var instructions: String?

  var extendedIngredients: [ExtendedIngredient]?
  
  var summary: String?
  
//  RecipeModal Health Values
  var dishTypes: [MealType]?
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
  var intolerances: [Intolerances]?
  var diets: [Diet]? // May need to be updated to dedicated type
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
  
  static func <(lhs: Self, rhs: Self) -> Bool {
    var returnedBool = false
    if let leftSide = lhs.title {
      if let rightSide = rhs.title {
        returnedBool = leftSide < rightSide
      }
    }
    return returnedBool
  }
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    var returnedBool = false
    if let leftSide = lhs.title {
      if let rightSide = rhs.title {
        returnedBool = leftSide < rightSide
      }
    }
    return returnedBool
  }
}
