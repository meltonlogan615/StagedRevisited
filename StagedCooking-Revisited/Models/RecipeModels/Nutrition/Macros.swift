//
//  Macros.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/10/22.
//

import Foundation
/**
 Will be passed into `MacrosModal` as a DataType for  `MacrosModal.macros` property.
 
 - Data is populated within the `generateMacros(for selectedRecipe: Recipe)` method, which is an extention of `RecipeViewController`.
 - Is oddly one of the only DataTypes that is not encumbered by all properties being `optional`
 */
struct Macros: Codable {
  var macros = [Flavonoid]()
   
  init(from recipe: Recipe) {
    var flavs = [Flavonoid]()
    guard let nutrition = recipe.nutrition else { return }
    guard let nutrients = nutrition.nutrients else { return }
    for nutrient in nutrients {
      let macro = Flavonoid(name: nutrient.name, amount: nutrient.amount, unit: nutrient.unit, percentOfDailyNeeds: nutrient.percentOfDailyNeeds)
      flavs.append(macro)
    }
    self.macros = flavs
  }
}
