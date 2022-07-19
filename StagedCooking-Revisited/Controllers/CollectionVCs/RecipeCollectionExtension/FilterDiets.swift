//
//  FilterDiets.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/18/22.
//

import UIKit

extension RecipeListCollectionView {
  func filterDiets(with selections: [Diet], from model: Response) {
    var newResults = [Recipe]()
    
    guard let recipes = model.results else { return }  // <- point of failure
    for recipe in recipes {
      guard let diets = recipe.diets else { return }
      let recipeDiets = NSSet(array: diets)
      let selectedDiets = NSSet(array: selections)
      if selectedDiets.isSubset(of: recipeDiets as! Set<AnyHashable>) {
        newResults.append(recipe)
      }
    }
    self.model.results = newResults
    self.recipeCollection.reloadData()
  }
}
