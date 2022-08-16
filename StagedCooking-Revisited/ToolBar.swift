//
//  ToolBar.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/10/22.
//

import Foundation
import UIKit

extension UIViewController {
  func setupToolbar(for view: UIViewController, textFields: [UITextField]) {
    
    let bar = UIToolbar()
    
    //Create a done button with an action to trigger our function to dismiss the keyboard
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
    
    //Create a felxible space item so that we can add it around in toolbar to position our done button
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
//    let suggestion = UIBarButtonItem(systemItem)
    
    //Add the created button items in the toobar
    bar.items = [flexSpace, flexSpace, doneButton]
    bar.sizeToFit()
    
    //Add the toolbar to our textfield
    for field in textFields {
      field.inputAccessoryView = bar
    }
  }
  
  @objc func dismissMyKeyboard(){
    view.endEditing(true)
  }
}
