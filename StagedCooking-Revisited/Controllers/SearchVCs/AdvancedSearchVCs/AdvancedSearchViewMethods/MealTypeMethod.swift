//
//  MealTypes.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/18/22.
//

import Foundation
import UIKit

extension UIViewController {
  func compileString(from meal: MealType) -> String {
    var typeString = "type="
    if meal.rawValue.contains(" ") {
      if let formatted = meal.rawValue.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
        typeString += "\(formatted)"
      }
    } else {
      typeString += "\(meal.rawValue)"
    }
    return typeString
  } 
}
