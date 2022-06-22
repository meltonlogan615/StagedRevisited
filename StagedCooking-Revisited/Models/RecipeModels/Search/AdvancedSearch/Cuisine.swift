//
//  Cuisine.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FILTER BY CUISINE
//

import Foundation

/**
  Enum for Cuisines that are supported by the API.
 
  Can be appended onto any search endpoint.
 
  Endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&cuisine=italian
 
  Conforms to:
 
 - `String` to allow access to the RawValue as a String.
 - `CaseIterable` to allow for the AdvanceSearch views to iterate over Cuisine.allCases and access the RawValue for use as `UILabel.text`.
 */

enum Cuisine: String, CaseIterable {
  case african,
       american,
       british,
       cajun,
       caribbean,
       chinese
  case easternEuropean = "Eastern European"
  case european,
       french,
       german,
       greek,
       indian,
       irish,
       italian,
       japanese,
       jewish,
       korean
  case latinAmerican = "Latin American"
  case mediterranean
  case middleEastern = "Middle Eastern"
  case nordic,
       southern,
       spanish,
       thai,
       vietnamese
}

/*
 to include - cuisine=
 to exclude - excludeCuisine=
 */
