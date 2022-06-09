//
//  GenerateMacros.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/8/22.
//

import Foundation

extension RecipeViewController {
  func generateMacrosModel(for selectedRecipe: Recipe) {
    guard let nutrition = selectedRecipe.nutrition as Nutrition? else { return }
    guard let nutrients = nutrition.nutrients as [Flavonoid]? else { return }
    for i in 0 ..< nutrients.count {
      guard let name = nutrients[i].name else { return }
      guard let amount = nutrients[i].amount else { return }
      guard let unit = nutrients[i].unit else { return }
      guard let dailyPercent = nutrients[i].percentOfDailyNeeds else { return }
      let macro = Macros(name: name, amount: amount, unit: unit, percentOfDailyNeeds: dailyPercent)
      macros.append(macro)
    }
  }
}
