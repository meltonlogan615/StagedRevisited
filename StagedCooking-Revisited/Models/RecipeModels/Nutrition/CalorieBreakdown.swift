// CaloricBreakdown.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let caloricBreakdown = try? newJSONDecoder().decode(CaloricBreakdown.self, from: jsonData)

import Foundation

// MARK: - CaloricBreakdown
struct CaloricBreakdown: Decodable {
  var percentProtein, percentFat, percentCarbs: Double?
}
