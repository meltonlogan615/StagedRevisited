//
//  CuisinesMethod.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/18/22.
//

import Foundation
import UIKit

extension UIViewController {
  func cuisineSelection(to method: Option, from choices: [Cuisine]) -> String {
    var returnString = String()
    switch method {
      case .include:
        let cuisines = compileString(from: choices)
        returnString = "include=\(cuisines)"
      case .exclude:
        let cuisines = compileString(from: choices)
        returnString = "exculde=\(cuisines)"
    }
    return returnString
  }
  
  fileprivate func compileString(from choices: [Cuisine]) -> String {
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
