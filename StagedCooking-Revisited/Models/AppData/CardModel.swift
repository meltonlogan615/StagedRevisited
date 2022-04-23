//
//  CardModel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation

struct Card: Codable, Identifiable, Comparable, Hashable {
  var id: Int
  var ingredients: [String]
  var instructions: String
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.id < rhs.id
  }
}
