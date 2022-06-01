// WeightPerServing.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weightPerServing = try? newJSONDecoder().decode(WeightPerServing.self, from: jsonData)

import Foundation

// MARK: - WeightPerServing
/**
 Will be passed into `Nutrition` as a subset of `Nutrition.weightPerServing` property.
 
 - Is not  being used in any current context at this time.
 */
struct WeightPerServing: Decodable {
  var amount: Int?
  var unit: String?
}

