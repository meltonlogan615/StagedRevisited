//
//  SafeCardModel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/15/22.
//

import Foundation

struct SafeCard: Codable, Hashable, Comparable, Identifiable {
  
  var id: Int
  var ingredients: [String]
  var instructions: String
  
  
//  init(id: Int, ingredients: [String], instructions: String) {
//    self.id = id
//    self.ingredients = ingredients
//    self.instructions = instructions
//  }
  
  static func == (lhs: SafeCard, rhs: SafeCard) -> Bool {
    return lhs.id < rhs.id
  }
  
  static func < (lhs: SafeCard, rhs: SafeCard) -> Bool {
    return lhs.id < rhs.id
  }
}
