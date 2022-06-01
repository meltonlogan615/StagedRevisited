//
//  Ingredient.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
/**
 DataType for `Ingredient`..
 
 Not currently in use..
 */
struct Ingredient: Codable, Identifiable, Comparable, Hashable {
  var id: Int?
  var aisle: String?
  var image: String?
  var name: String?
  var originalString: String?
  var metaInformation: [String]?
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    var result = false
    if let leftTitle = lhs.name {
      if let rightTitle = rhs.name {
        result = leftTitle < rightTitle
      }
    }
    return result
  }
}

