//
//  TextFieldDelegate.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import Foundation
import UIKit

extension UIView: UITextFieldDelegate {
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    return true
  }
  
  public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    return true
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
  }
}
