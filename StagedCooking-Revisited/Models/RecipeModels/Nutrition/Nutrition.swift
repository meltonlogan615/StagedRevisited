// Nutrition.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nutrition = try? newJSONDecoder().decode(Nutrition.self, from: jsonData)

import Foundation

// MARK: - Nutrition

/**
 Holder for additional DataTypes (Each property of `Nutrition` is itself a custom DataType).
 */
struct Nutrition: Codable, Hashable {
  var nutrients, properties, flavonoids: [Flavonoid]?
  var caloricBreakdown: CaloricBreakdown?
  var weightPerServing: WeightPerServing?
  
  static func == (lhs: Nutrition, rhs: Nutrition) -> Bool {
    var result = false
    if let nutrientsL  = lhs.nutrients {
      if let nutrientsR = rhs.nutrients {
        if nutrientsL == nutrientsR {
          result = true
        }
      }
    }
    return result
  }
  
}
