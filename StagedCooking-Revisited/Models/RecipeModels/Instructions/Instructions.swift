//
//  Instructions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/12/22.
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Instructions
/**
 General holder for `[Step]`, with an additional `name` property.
 */
struct Instructions: Decodable, Hashable {
  var name: String?
  var steps: [Step]?
}


// MARK: - Step
/**
 DataType for `Step` poperty that is passed as an array into `Instructions`.
 
 `Number`:
 - The chronological order of the step in the `Recipe`
 
  `Step`:
 - The verbage describing the actions to take.
 
Additional properties are custom DataTypes and are listed below.
 */
struct Step: Codable, Hashable, Comparable {
  var number: Int?
  var step: String?
  var ingredients: [StepIngredient]?
  var equipment: [StepEquipment]?
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


// MARK: - Step Subs
/**
 DataType for `StepIngredient`.
 
 Will be passed into `Step` within and array.
 */
struct StepIngredient: Codable, Identifiable, Hashable {
  var id: Int?
  var name, localizedName, image: String?
}


// MARK: - StepEquipment
/**
 DataType for `StepEquipment`.
 
 Will be passed into `Step` within and array.
 
 Currently not in use.
 */
struct StepEquipment: Codable, Identifiable, Hashable {
  var id: Int?
  var name, localizedName, image: String?
}

// MARK: - Length
/**
 DataType for `Length`.
 
 Will be passed into `Step` as a sigular value.

 Designed to display how long a `Step` should take.
 
 Examples of units: `seconds`, `minutes`, `hours`, etc.
 
 Currently not in use.
 */
struct Length: Codable, Hashable {
  var number: Int?
  var unit: String?
}

// MARK: - Temperature
/**
 
 DataType for `Temperature`.property
 
 Examples of units: `fahrenheit`, `celsius`, `kelvin`(?), etc..
 
 Currently not in use.
 */
struct Temperature: Codable, Hashable {
  var number: Int?
  var unit: String?
}
