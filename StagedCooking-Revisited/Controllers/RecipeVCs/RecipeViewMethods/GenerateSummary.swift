//
//  GenerateSummary.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/8/22.
//

import Foundation

// Removes the html tags from the recipe summary and returns a regular string rather than previous attempts that were using attributed strings for html
extension RecipeViewController {
  func generateSummary(for selectedRecipe: Recipe) {
    guard let summery = self.recipe.summary else { return }
    let formattedSummery = summery.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    let brokenSummary = formattedSummery.replacingOccurrences(of: ". ", with: ".\n\n")
    self.summary = brokenSummary
  }
}
