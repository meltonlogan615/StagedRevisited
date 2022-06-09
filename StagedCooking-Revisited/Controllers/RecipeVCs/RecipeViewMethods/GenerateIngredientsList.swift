//
//  GenerateIngredientsList.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/8/22.
//

import Foundation

extension RecipeViewController {
  func generateIngredientsList(for selectedRecipe: Recipe) {
    // checks to see if array is empty before adding new data.
    // Resolved issue #13
    if self.ingredientList.isEmpty {
      guard let extendedIngredients = selectedRecipe.extendedIngredients as [ExtendedIngredient]? else { return }
      for i in 0 ..< extendedIngredients.count {
        // reformats to improve chances of matching against stepIngredients
        guard let original = extendedIngredients[i].original?.replacingOccurrences(of: "-", with: " ") else { return }
        self.ingredientList.append(original)
      }
      
    }
  }
}
