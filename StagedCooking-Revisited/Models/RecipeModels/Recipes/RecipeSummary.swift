//
//  RecipeSummary.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

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
