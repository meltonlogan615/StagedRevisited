// Nutrition.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nutrition = try? newJSONDecoder().decode(Nutrition.self, from: jsonData)

import Foundation

// MARK: - Nutrition
struct Nutrition: Decodable {
  var nutrients, properties, flavonoids: [Flavonoid]?
  var caloricBreakdown: CaloricBreakdown?
  var weightPerServing: WeightPerServing?
}