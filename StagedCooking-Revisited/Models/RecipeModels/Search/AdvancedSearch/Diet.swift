//
//  Diet.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FIND BY DIETS
// endpoint example:

import Foundation

/**
 Enum for Cuisines that are supported by the API.
 
 Can be appended onto any search endpoint.
 
 Endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&diet=vegan
 
 Conforms to:
 
 - `String` to allow access to the RawValue as a String.
 - `CaseIterable` to allow for the AdvanceSearch views to iterate over Cuisine.allCases and access the RawValue for use as `UILabel.text`.
 */

enum Diet: String, CaseIterable, Codable, Equatable {
  case dairyFree = "dairy free"
  case fodmapFriendly = "fodmap friendly"
  case glutenFree = "gluten free"
  case ketogenic
  case lactoVegetarian = "lacto-vegetarian"
  case lactoOvoVegetarian = "lacto ovo vegetarian"
  case lowFodmmap = "Low FODMAP"
  case ovoVegetarian = "Ovo-Vegetarian"
  case paleo, pescatarian, primal, vegan, vegetarian, whole30
}
