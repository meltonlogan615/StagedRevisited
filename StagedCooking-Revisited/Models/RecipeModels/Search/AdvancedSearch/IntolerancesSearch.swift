//
//  IntolerancesSearch.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FILTER OUT INTOLERANCES

// TODO: - Keep as an option for advanced search, but also have in settings so all recipes will include these parameters

import Foundation

/**
 Enum for Cuisines that are supported by the API.
 
 Can be appended onto any search endpoint. Multiple selections use CSV formatting
 
 Endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&intolerances=shellfish,dairy

 Conforms to:
 
 - `String` to allow access to the RawValue as a String.
 - `CaseIterable` to allow for the AdvanceSearch views to iterate over Cuisine.allCases and access the RawValue for use as `UILabel.text`.
 */

enum Intolerances: String, Codable, CaseIterable {
  case dairy, egg, gluten, grain, peanut, seafood, sesame, shellfish, soy, sulfite
  case treeNut = "Tree Nut"
  case wheat
}
