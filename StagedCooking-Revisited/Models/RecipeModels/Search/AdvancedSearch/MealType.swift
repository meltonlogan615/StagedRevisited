//
//  MealTypes.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FILTER BY MEAL TYPE

import Foundation

/**
 Enum for Cuisines that are supported by the API.
 
 Can be appended onto any search endpoint.
 
 Endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&type=soup
 
 Conforms to:
 
 - `String` to allow access to the RawValue as a String.
 - `CaseIterable` to allow for the AdvanceSearch views to iterate over Cuisine.allCases and access the RawValue for use as `UILabel.text`.
 */

enum MealType: String, Codable, CaseIterable {
  case antipasti, antipasto, appetizer, beverage, bread, breakfast, brunch, condiment, dessert, dinner, dip, drink
  case fingerfood // = "Finger Food"
  case frosting
  case hordoeuvre = "hor d'oeuvre"
  case icing
  case lunch
  case mainCourse = "main course"
  case mainDish = "main dish"
  case marinade
  case morningMeal = "morning meal"
  case salad, sauce
  case sideDish = "side dish"
  case snack, soup, spread, starter
}
