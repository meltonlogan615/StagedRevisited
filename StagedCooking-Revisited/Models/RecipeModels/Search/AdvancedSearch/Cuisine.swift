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
  case caribbean, mediterranean, nordic, southern
  
  case african = "African 🌍"
  case american = "American 🇺🇸"
  case british = "British 🇬🇧"
  case cajun = "Cajun 🐊"
  case chinese = "Chinese 🇨🇳"
  case european = "European 🇪🇺"
  case french = "French 🇫🇷"
  case german = "German 🇩🇪"
  case greek = "Greek 🇬🇷"
  case indian = "Indian 🇮🇳"
  case irish = "Irish 🇮🇪"
  case italian = "Italian 🇮🇹"
  case japanese = "Japanese 🇯🇵"
  case jewish = "Jewish 🇮🇱"
  case korean = "Korean 🇰🇷"
  case spanish = "Spanish 🇪🇸"
  case thai = "Thai 🇹🇭"
  case vietnamese = "Vietnamese 🇻🇳"
  case easternEuropean = "Eastern European"
  case latinAmerican = "Latin American"
  case middleEastern = "Middle Eastern"
}

/*
 to include - cuisine=
 to exclude - excludeCuisine=
 */
