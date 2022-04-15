//
//  ChefDefault.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

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
  
  static func addToFavorites(recipe: Recipe) {
    //    MyList.favoriteRecipes.append(recipe)
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
  
  static func saveChanges() {
    ChefDefault.defaults.set(ChefDefault.favoriteRecipes, forKey: "favorites")
    ChefDefault.defaults.set(ChefDefault.savedRecipes, forKey: "saved")
    ChefDefault.defaults.set(ChefDefault.viewedRecipes, forKey: "viewed")
    ChefDefault.defaults.set(ChefDefault.searchHistory, forKey: "history")
  }
  
  static func loadData() {
    ChefDefault.favoriteRecipes = ChefDefault.defaults.object(forKey: "favorites") as? [Recipe] ?? [Recipe]()
    ChefDefault.savedRecipes = ChefDefault.defaults.object(forKey: "saved") as? [Recipe] ?? [Recipe]()
    ChefDefault.viewedRecipes = ChefDefault.defaults.object(forKey: "viewed") as? [[String: String]] ?? [[String: String]]()
    ChefDefault.searchHistory = ChefDefault.defaults.object(forKey: "history") as? [String] ?? [String]()
  }
  
}
