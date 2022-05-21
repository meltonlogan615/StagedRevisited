//
//  IntolerancesSearch.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FILTER OUT INTOLERANCES, can be appended onto any search endpoint. COMMA SEPARATED VALUES
// endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&intolerances=shellfish,dairy

// TODO: - Keep as an option for advanced search, but also have in settings so all recipes will include these parameters

import Foundation

enum Intolerances: String, CaseIterable {
  case dairy, egg, gluten, grain, peanut, seafood, sesame, shellfish, soy, sulfite
  case treeNut = "Tree Nut"
  case wheat
}
