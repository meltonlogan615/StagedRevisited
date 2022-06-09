//
//  DietsMethod.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/18/22.
//

import Foundation
import UIKit

extension UIViewController {
  func dietaryRestrictions(from choices: [Diet]) -> String {
    var resultString = "diet="
    switch choices.count {
        
        // No Intolerances Selected
      case 0:
        resultString = ""
        
        // One Intolerance Selected
      case 1:
        if choices[0].rawValue.contains(" ") {
          if let formatted = choices[0].rawValue.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
            resultString += formatted
          }
        } else {
          resultString += choices[0].rawValue.localizedLowercase
        }
        
        // Multiple Intoerances Selected
      default:
        let allSelctions = compileString(from: choices)
        resultString += allSelctions
    }
    return resultString
  }
  
  // Method for dealing with Mutliple Selected
  fileprivate func compileString(from choices: [Diet]) -> String {
    var allAllergens = String()
    
    // Loop through selection
    for choice in choices {
      
      let chosen = choice.rawValue
      
      if chosen.contains(" ") {
        if let diet = chosen.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
          allAllergens += "\(diet)"
        }
      } else {
        allAllergens += "\(chosen)"
      }
      if choice != choices.last {
        allAllergens += ","
      }
    }
    return allAllergens
  }
}
