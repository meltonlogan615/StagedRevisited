//
//  SettingsView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

// TODO: - Setup Collection View Similar to AdvancedSearchViewController

import Foundation
import UIKit

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
