//
//  TempData.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/13/22.
//

import Foundation
import UIKit

struct Temp {
  static let cards = [
    Card(number: Optional(1), ingredients: Optional(["1 1/2 cups water"]), instructions: Optional("In a medium saucepan, bring 1 1/2 cups water to a boil.")),
    Card(number: Optional(7), ingredients: Optional([""]), instructions: Optional("Remove from heat,")),
    Card(number: Optional(2), ingredients: Optional(["3/4 cup medium grain rice or short grain rice", "1/4 teaspoon salt (heaping)"]), instructions: Optional("Add rice, salt and stir.")),
    Card(number: Optional(5), ingredients: Optional([""]), instructions: Optional("Stir constantly until thick and creamy, for 15 to 20 minutes.")),
    Card(number: Optional(3), ingredients: Optional(["1 1/2 cups water"]), instructions: Optional("Simmer covered until water has been absorbed (approximately 15 minutes).")),
    Card(number: Optional(10), ingredients: Optional([""]), instructions: Optional("Serve warm.")),
    Card(number: Optional(6), ingredients: Optional(["4 cups whole milk (I use 2%%)", "1 egg, beaten"]), instructions: Optional("Combine 1/2 cup milk, and beaten egg, then add to saucepan. Cook 2 minutes more, stirring constantly")),
    Card(number: Optional(8), ingredients: Optional(["1/2 teaspoon vanilla", "1 teaspoon butter"]), instructions: Optional("Add in butter, and vanilla.")),
    Card(number: Optional(4), ingredients: Optional(["1/2 cup sugar", "4 cups whole milk (I use 2%%)"]), instructions: Optional("In another sauce pan, stir in 1 1/2 milk, sugar, and 1 1/2 cups cooked rice, cook over medium heat")),
    Card(number: Optional(9), ingredients: Optional(["1 pinch cinnamon", "pinch nutmeg"]), instructions: Optional("Season with a pinch of nutmeg or cinnamon."))
  ]
  
  static let cardData = [8: ["Add in butter, and vanilla.": ["1/2 teaspoon vanilla", "1 teaspoon butter"]], 10: ["Serve warm.": []], 2: ["Add rice, salt and stir.": ["3/4 cup medium grain rice or short grain rice", "1/4 teaspoon salt (heaping)"]], 4: ["In another sauce pan, stir in 1 1/2 milk, sugar, and 1 1/2 cups cooked rice, cook over medium heat": ["1/2 cup sugar"]], 9: ["Season with a pinch of nutmeg or cinnamon.": ["1 pinch cinnamon", "pinch nutmeg"]], 1: ["In a medium saucepan, bring 1 1/2 cups water to a boil.": ["1 1/2 cups water"]], 6: ["Combine 1/2 cup milk, and beaten egg, then add to saucepan. Cook 2 minutes more, stirring constantly": ["4 cups whole milk (I use 2%%)", "1 egg, beaten"]], 5: ["Stir constantly until thick and creamy, for 15 to 20 minutes.": []], 3: ["Simmer covered until water has been absorbed (approximately 15 minutes).": []], 7: ["Remove from heat,": []]]
}

