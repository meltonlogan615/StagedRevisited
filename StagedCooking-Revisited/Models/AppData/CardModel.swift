//
//  CardModel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation

struct Card: Comparable {
  var number: Int?
  var ingredients: [String]?
  var instructions: String?
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    var result = false
    if let left = lhs.number {
      if let right = rhs.number {
        result = left < right
      }
    }
    return result
  }
  

}
