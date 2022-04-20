//
//  QTInstructions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/12/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Instructions
struct Instructions: Decodable, Hashable {
  var name: String?
  var steps: [Step]?
}

// MARK: - Step
struct Step: Codable, Hashable, Comparable {
  var number: Int?
  var step: String?
  var ingredients: [StepIngredient]?
  var equipment: [Ent]?
  var length: Length?
  
  static func <(lhs: Self, rhs: Self) -> Bool {
    var returned = false
    if let leftSide = lhs.number {
      if let rightSide = rhs.number {
        returned = leftSide < rightSide
      }
    }
    return returned
  }
}

// MARK: - Ent
struct StepIngredient: Codable, Identifiable, Hashable {
  var id: Int?
  var name, localizedName, image: String?
}

struct Ent: Codable, Identifiable, Hashable {
  var id: Int?
  var name, localizedName, image: String?
}

// MARK: - Length
struct Length: Codable, Hashable {
  var number: Int?
  var unit: String?
}
