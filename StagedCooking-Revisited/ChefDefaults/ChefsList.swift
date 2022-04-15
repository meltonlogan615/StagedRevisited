//
//  MyList.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/6/22.
//

import Foundation

struct ChefsList {
  static var defaults = UserDefaults.standard
  static var favoriteRecipes = [Recipe]()
  static var savedRecipes = [Recipe]() // Saved, but not an explicit favorite. But can still be both
  static var viewedRecipes = [[String: String]]()
  static var searchHistory = [String]() // perhaps used later as part of an autocomplete in search
  
  mutating func setFavorites(recipe: Recipe) {
    ChefsList.favoriteRecipes.append(recipe)
  }
  
  mutating func setSaved(recipe: Recipe) {
    ChefsList.savedRecipes.append(recipe)
  }
  
  mutating func addToViewed(recipeDictionary: [String: String]) {
    ChefsList.viewedRecipes.insert(recipeDictionary, at: 0)
  }
  
  mutating func addToSearchHistory(searchTerm: String) {
    ChefsList.searchHistory.insert(searchTerm, at: 0)
  }
  
  func saveChanges() {
    ChefsList.defaults.set(ChefsList.favoriteRecipes, forKey: "favorites")
    ChefsList.defaults.set(ChefsList.savedRecipes, forKey: "saved")
    ChefsList.defaults.set(ChefsList.viewedRecipes, forKey: "viewed")
    ChefsList.defaults.set(ChefsList.searchHistory, forKey: "history")
  }
  
  func loadData() {
    ChefsList.favoriteRecipes = ChefsList.defaults.object(forKey: "favorites") as? [Recipe] ?? [Recipe]()
    ChefsList.savedRecipes = ChefsList.defaults.object(forKey: "saved") as? [Recipe] ?? [Recipe]()
    ChefsList.viewedRecipes = ChefsList.defaults.object(forKey: "viewed") as? [[String: String]] ?? [[String: String]]()
    ChefsList.searchHistory = ChefsList.defaults.object(forKey: "history") as? [String] ?? [String]()
  }
  
}
