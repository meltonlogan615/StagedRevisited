//
//  DietsMethod.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/18/22.
//

import Foundation
import UIKit

extension UIViewController {
  func dietaryRestrictions(from choices: [String]) -> String {
    var resultString = "diet="
    switch choices.count {
        
        // No Intolerances Selected
      case 0:
        resultString = ""
        
        // One Intolerance Selected
      case 1:
        if choices[0].contains(" ") {
          if let formatted = choices[0].addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
            resultString += formatted
          }
        } else {
          resultString += choices[0].localizedLowercase
        }
        
        // Multiple Intoerances Selected
      default:
        let allSelctions = compileString(from: choices)
        resultString += allSelctions
    }
    return resultString
  }
  
  // Method for dealing with Mutliple Selected
  fileprivate func compileString(from choices: [String]) -> String {
    var allDiets = String()
    
    // Loop through selection
    for choice in choices {
      
      let chosen = choice
      
      if chosen.contains(" ") {
        if let diet = chosen.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
          allDiets += "\(diet)"
        }
      } else {
        allDiets += "\(chosen)"
      }
      if choice != choices.last {
        allDiets += ","
      }
    }
    return allDiets
  }
}
