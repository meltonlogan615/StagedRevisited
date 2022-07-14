// Flavonoid.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let flavonoid = try? newJSONDecoder().decode(Flavonoid.self, from: jsonData)

import Foundation

// MARK: - Flavonoid

/**
 Is generically defined and used for maximum flexibility.
 
 Is currently used for the following `Nutrition` properties:
 - `Nutrition.nutrients`
 - `Nutrition.properties`
 - `Nutrition.flavonoids` (which I'm not entirely sure is being used in any current context at this time.
 */
struct Flavonoid: Codable, Comparable {
  var name: String?
  var amount: Double?
  var unit: String?
  var percentOfDailyNeeds: Double?
  
  static func <(lhs: Self, rhs: Self) -> Bool {
    var returnedBool = false
    if let leftSide = lhs.amount {
      if let rightSide = rhs.amount {
        returnedBool = leftSide < rightSide
      }
    }
    return returnedBool
  }
}
