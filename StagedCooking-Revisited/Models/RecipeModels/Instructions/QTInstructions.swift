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

// MARK: - WelcomeElement
struct QTInstructions: Decodable {
  var name: String?
  var steps: [QTStep]?
}

// MARK: - Step
struct QTStep: Codable {
  var number: Int?
  var step: String?
  var ingredients, equipment: [Ent]?
  var length: Length?
}

// MARK: - Ent
struct Ent: Codable {
  var id: Int?
  var name, localizedName, image: String?
}

// MARK: - Length
struct Length: Codable {
  var number: Int?
  var unit: String?
}
