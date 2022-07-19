//
//  FilterMealTypes.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/18/22.
//

import Foundation

extension RecipeListCollectionView {
  func filterMeals(with selections: [MealType], from model: Response) {
    var newResults = [Recipe]()
    
    guard let recipes = model.results else { return }  // <- point of failure
    for recipe in recipes {
      guard let dishes = recipe.dishTypes else { return }
      let recipeDishes = NSSet(array: dishes)
      let selectedDishes = NSSet(array: selections)
      if selectedDishes.isSubset(of: recipeDishes as! Set<AnyHashable>) {
        newResults.append(recipe)
      }
    }
    self.model.results = newResults
    self.recipeCollection.reloadData()
  }
}
