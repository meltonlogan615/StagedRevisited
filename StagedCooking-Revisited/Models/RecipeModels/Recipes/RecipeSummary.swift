//
//  RecipeSummary.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
/**
 Simplified form of `Recipe` with only `id`, `title`, and `summary` properties.
 
 Currently not in use.
 */

struct RecipeSummary: Decodable, Identifiable, Comparable, Hashable {
  var id: Int?
  var title: String?
  var summary: String?
  
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
