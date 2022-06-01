//
//  SettingsView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

// TODO: - Setup Collection View Similar to AdvancedSearchViewController

import Foundation
import UIKit
/**
 View of Chef Settings.
 
 Will be locally hosted in `ChefDefaults`
 
 Needs:
 - Intolerances
 - Diets
 - User defined Array of words to exclude? Will need to check the API to see if that is an option.

 Say someone hates mushrooms and olives (it's me, I'm that someone), and they don't want any recipes that include those ingredients. Need to find a way to make sure that they are not included.
 
 */
class SettingsView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = K.primary
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 200, height: 200)
  }
}

extension SettingsView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    
  }
}
