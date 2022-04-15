//
//  SearchResult.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

struct SearchResult: Decodable, Identifiable, Comparable, Hashable {
  var id: Int? //716429,
  var title: String? // Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs,
  var calories: Int? // 584,
  var carbs: String? // 84g,
  var fat: String? // 20g,
  var image: String? // https://spoonacular.com/recipeImages/716429-312x231.jpg,
  var imageType: String? // jpg,
  var protein: String? // 19g
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    var result = false
    if let leftTitle = lhs.title {
      if let rightTitle = rhs.title {
        result = leftTitle < rightTitle
      }
    }
    return result
  }
}


