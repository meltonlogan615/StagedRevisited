//
//  Diet.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FIND BY DIETS, can be appended onto any search endpoint
// endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&diet=vegan

import Foundation

enum Diet: String {
case ketogenic, vegetarian, vegan, pescetarian, paleo, primal, whole30
  case glutenFree = "Gluten Free"
  case lactoVegetarian = "Lacto-Vegetarian"
  case ovoVegetarian = "Ovo-Vegetarian"
  case lowFodmmap = "Low FODMAP"
}
