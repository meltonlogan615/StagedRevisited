//
//  ChefDefault.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

// MARK: - Only Available with Subscription

import Foundation
/**
 AKA `UserDefaults`.
 
 Local storage for `searchHistory`, `savedRecipes`, `favoriteRecipes`, and `viewedRecipes`.
 
 `SearchHistory`:
 - An array of strings of what has been entered into the `searchTextField` located in the `SearchView`.
 
 `SavedRecipes`:
 - An array of `Recipe`s that the Chef wants to save for future use.
 
 `FavoriteRecipes`:
 - An  array of `Recipe`'s that the Chef enjoyed and will return to again.
 
 `ViewedRecipes`:
 - A dictionary? of String: String?
 - I'm not sure what the hell I was thinking when I set this up.
 
 Futher down the line, `isLoggedIn`, `hasOnboarded`, `intolerances`, and `dietPreferences` will be added as well.
 
 `isLoggedIn`:
 - `Bool` that if true, will enable full functionality.
 
 `hasOnboarded`:
 - `Bool` that if true, will skip onboarding process and jump right to `SearchViewController`.
 
 `intolerances`:
 - An  array of `Intolerances`'s that will be applied to all recipe searches.
 
 `dietPreferences`:
 - An  array of `Diet`'s that will be applied to all recipe searches.
 */
struct ChefDefault {
  static var defaults = UserDefaults.standard
  
  static var favoriteRecipes = [String: String]()
  static var savedRecipes = [String: String]() // Saved, but not an explicit favorite. But can still be both
  static var viewedRecipes = [String: String]()
  static var searchHistory = [String]() // perhaps used later as part of an autocomplete in search
  static var hateListe = [String: String]() // Never see a recipe again.
  
  static var isLoggedIn = true
  static var hasOnboarded = false
  
  static var intolerances = [Intolerances]()
  static var dietPreferences = [Diet]()
  
  static func saveSettings(allergies: [Intolerances]?, restrictions: [Diet]?) {
    if let intolerances = allergies {
      ChefDefault.intolerances += intolerances
    }
    if let diets = restrictions {
      ChefDefault.dietPreferences += diets
    }
  }
  
  static func addToFavorites(recipeID: String, recipeTitle: String) {
    self.favoriteRecipes[recipeID] = recipeTitle
  }
  
  static func addToSaved(recipeID: String, recipeTitle: String) {
    self.savedRecipes[recipeID] = recipeTitle
  }
  
  static func addToViewed(recipeID: String, recipeTitle: String) {
    viewedRecipes[recipeID] = recipeTitle
    self.defaults.set(viewedRecipes, forKey: "Viewed")
  }
  
  static func addToSearchHistory(searchTerm: String) {
    self.searchHistory.insert(searchTerm, at: 0)
  }
  
  static func addToDietPreferences(diet: Diet) {
    self.dietPreferences.insert(diet, at: 0)
  }
  
  static func addToIntolerances(intolerance: Intolerances) {
    self.intolerances.insert(intolerance, at: 0)
  }
  
  static func saveChanges() {
    ChefDefault.defaults.set(ChefDefault.favoriteRecipes, forKey: "favorites")
    ChefDefault.defaults.set(ChefDefault.savedRecipes, forKey: "saved")
    ChefDefault.defaults.set(ChefDefault.viewedRecipes, forKey: "viewed")
    ChefDefault.defaults.set(ChefDefault.searchHistory, forKey: "history")
//    ChefDefault.defaults.set(ChefDefault.intolerances, forKey: "intolerances")
//    ChefDefault.defaults.set(ChefDefault.dietPreferences, forKey: "diets")
  }
  
  static func loadData() {
    if let favorites = ChefDefault.defaults.object(forKey: "favorites") as? [String: String] {
      ChefDefault.favoriteRecipes = favorites
    }

    if let saved = ChefDefault.defaults.object(forKey: "saved") as? [String: String] {
      ChefDefault.savedRecipes = saved
    }
    
    if let viewed = ChefDefault.defaults.object(forKey: "viewed") as? [String: String] {
      ChefDefault.viewedRecipes = viewed
    }
    
    if let history = ChefDefault.defaults.object(forKey: "history") as? [String] {
      ChefDefault.searchHistory = history
    }
    
    if let intolerances = ChefDefault.defaults.object(forKey: "intolerances") as? [Intolerances] {
      ChefDefault.intolerances = intolerances
    }
    
    if let diets = ChefDefault.defaults.object(forKey: "diets") as? [Diet] {
      ChefDefault.dietPreferences = diets
    }
  }
  
}
