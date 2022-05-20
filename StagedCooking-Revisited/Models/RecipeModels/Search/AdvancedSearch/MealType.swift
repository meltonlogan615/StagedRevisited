//
//  MealTypes.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FILTER BY MEAL TYPE, can be appended onto any search endpoint
// regular endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&type=soup

import Foundation

enum MealType: String {
  case dessert, appetizer, salad, bread, breakfast, soup, beverage, sauce, marinade, fingerfood, snack, drink
  case mainCourse = "Main Course"
  case sideDish = "Side Dish"
}
