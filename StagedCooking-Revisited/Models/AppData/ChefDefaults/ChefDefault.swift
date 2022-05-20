//
//  ChefDefault.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

// MARK: - Only Available with Subscription

import Foundation

struct ChefDefault {
  static var searched = ""
  static var requestedID = 0
  static var selectedRecipe: Recipe?
  
  static var isLoggedIn = true
  static var defaults = UserDefaults.standard
  
  static var favoriteRecipes = [Recipe]()
  static var savedRecipes = [Recipe]() // Saved, but not an explicit favorite. But can still be both
  static var viewedRecipes = [[String: String]]()
  static var searchHistory = [String]() // perhaps used later as part of an autocomplete in search
  
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
  
  static func addToFavorites(recipe: Recipe) {
    ChefDefault.favoriteRecipes.insert(recipe, at: 0)
  }
  
  static func addToSaved(recipe: Recipe) {
    ChefDefault.savedRecipes.append(recipe)
  }
  
  static func addToViewed(recipeDictionary: [String: String]) {
    ChefDefault.viewedRecipes.insert(recipeDictionary, at: 0)
  }
  
  static func addToSearchHistory(searchTerm: String) {
    ChefDefault.searchHistory.insert(searchTerm, at: 0)
  }
  
  static func addToDietPreferences(diet: Diet) {
    ChefDefault.dietPreferences.insert(diet, at: 0)
  }
  
  static func addToIntolerances(intolerance: Intolerances) {
    ChefDefault.intolerances.insert(intolerance, at: 0)
  }
  
  static func saveChanges() {
    ChefDefault.defaults.set(ChefDefault.favoriteRecipes, forKey: "favorites")
    ChefDefault.defaults.set(ChefDefault.savedRecipes, forKey: "saved")
    ChefDefault.defaults.set(ChefDefault.viewedRecipes, forKey: "viewed")
    ChefDefault.defaults.set(ChefDefault.searchHistory, forKey: "history")
    ChefDefault.defaults.set(ChefDefault.intolerances, forKey: "intolerances")
    ChefDefault.defaults.set(ChefDefault.dietPreferences, forKey: "diets")
  }
  
  
  static func loadData() {
    if let favorites = ChefDefault.defaults.object(forKey: "favorites") as? [Recipe] {
      ChefDefault.favoriteRecipes = favorites
    }

    if let saved = ChefDefault.defaults.object(forKey: "saved") as? [Recipe] {
      ChefDefault.savedRecipes = saved
    }
    
    if let viewed = ChefDefault.defaults.object(forKey: "viewed") as? [[String: String]] {
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
