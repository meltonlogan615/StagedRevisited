//
//  TextFieldDelegate.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import Foundation
import UIKit


/// Generic implamentation of a UITextFieldDelegate as an extension of a UIView.
/// This will allow for any UIView with a UITextField to quickly implament self.delegate = self in and of its `load` methods.
extension UIViewController: UITextFieldDelegate {
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    return true
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    
  }
}

