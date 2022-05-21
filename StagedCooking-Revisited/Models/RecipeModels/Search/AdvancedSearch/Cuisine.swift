//
//  Cuisine.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FILTER BY CUISINE, can be appended onto any search endpoint
// endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&cuisine=italian

import Foundation

enum Cuisine: String, CaseIterable {  
  case african = "African 🌍"
  case american = "American 🇺🇸"
  case british = "British 🇬🇧"
  case cajun = "Cajun 🐊"
  case caribbean
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
  case mediterranean, nordic, southern
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
