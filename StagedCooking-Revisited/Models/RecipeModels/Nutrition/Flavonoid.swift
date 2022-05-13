// Flavonoid.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let flavonoid = try? newJSONDecoder().decode(Flavonoid.self, from: jsonData)

import Foundation

// MARK: - Flavonoid
struct Flavonoid: Decodable {
  var name: String?
  var amount: Double?
  var unit: String?
  var percentOfDailyNeeds: Double?
}
