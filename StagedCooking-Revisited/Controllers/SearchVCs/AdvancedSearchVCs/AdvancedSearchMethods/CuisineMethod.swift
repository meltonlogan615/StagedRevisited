//
//  CuisinesMethod.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/18/22.
//

import Foundation
import UIKit

enum AdvancedOptions: String, CaseIterable {
  case Cuisines, Diets, Intolerances, Macros, MealType
}

extension UIViewController {
  func makeSelection(to method: Option, from choices: AdvancedOptions.AllCases) -> String {
    var returnString = String()
    let option = compileString(from: choices)
    switch method {
      case .include:
        returnString = "include=\(option)"
      case .exclude:
        returnString = "exculde=\(option)"
    }
    return returnString
  }
  
  fileprivate func compileString(from choices: AdvancedOptions.AllCases) -> String {
    var allCuisines = String()
    
    // Loop through selection
    for choice in choices {
      
      let chosen = choice.rawValue
      
      if chosen.contains(" ") {
        if let cuisine = chosen.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
          allCuisines += "\(cuisine)"
        }
      } else {
        allCuisines += "\(chosen)"
      }
      if choice != choices.last {
        allCuisines += ","
      }
    }
    return allCuisines
  }
}
