// CaloricBreakdown.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let caloricBreakdown = try? newJSONDecoder().decode(CaloricBreakdown.self, from: jsonData)

import Foundation

// MARK: - CaloricBreakdown
/**
 Struct for `CaloricBreakdown`.

Each property is a `Double` that will be passed into `Nutrition` as a subset of its `Nutrition.caloricBreakdown` property.
 
 - Is currently not in use.
 */
struct CaloricBreakdown: Codable {
  var percentProtein, percentFat, percentCarbs: Double?
}
