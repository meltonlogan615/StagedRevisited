//
//  SuggestionsModel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 9/20/22.
//

import UIKit

struct Suggestion: Comparable {
  var splashImage: UIImage
  var titleLabel: UILabel
  var titleText: String
  var recipeID: Int
  var diet: Diet
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.titleText < rhs.titleText
  }
}

struct Suggestions: Codable {
  var suggestions: [Suggestions]
}
