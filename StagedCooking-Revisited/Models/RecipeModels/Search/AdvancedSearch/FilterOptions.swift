//
//  FilterOptions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/30/22.
//

import Foundation
/**
 Enum for all of the different filters that can be applied
 
 */
enum Filters: String, CaseIterable {
  case Cuisine
  case Diet
  case Intolerances
  case AdvancedMacros
  case MealType
}
