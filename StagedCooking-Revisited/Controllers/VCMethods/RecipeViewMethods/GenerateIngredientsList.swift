//
//  GenerateIngredientsList.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation

extension RecipeViewController {
  func generateIngredientsList(for selectedRecipe: Recipe) {
    guard let extendedIngredients = selectedRecipe.extendedIngredients as [ExtendedIngredient]? else { return }
    for i in 0 ..< extendedIngredients.count {
      guard let original = extendedIngredients[i].original?.replacingOccurrences(of: "-", with: " ") else { return }
      self.ingredientList.append(original)
    }
  }
}
