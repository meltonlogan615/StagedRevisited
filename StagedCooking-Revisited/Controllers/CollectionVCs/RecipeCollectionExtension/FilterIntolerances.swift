//
//  FilterIntolerances.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/18/22.
//
// voxdub-gyhpa7-poqJaz
import Foundation

// CURRENTLY NOT IN USE, NO EXAMPLES OF IT IN RESULTS
extension RecipeListCollectionView {
  func filterIntolerances(with selections: [Intolerance], from model: Response) {
    var newResults = [Recipe]()
    
    guard let recipes = model.results else { return }  // <- point of failure
    for recipe in recipes {
      guard let intolerances = recipe.intolerances else { return }
      let recipeIntolerances = NSSet(array: intolerances)
      let selectedIntolerances = NSSet(array: selections)
      if selectedIntolerances.isSubset(of: recipeIntolerances as! Set<AnyHashable>) {
        newResults.append(recipe)
      }
    }
    self.model.results = newResults
    self.recipeCollection.reloadData()
  }
}
