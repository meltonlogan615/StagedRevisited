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

enum MealType: String, CaseIterable {
  case  appetizer, beverage, bread, breakfast, dessert, drink
  case fingerfood = "Finger Food"
  case mainCourse = "Main Course"
  case marinade, salad, sauce
  case sideDish = "Side Dish"
  case snack, soup
}
