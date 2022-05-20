//
//  AdvancedMacrosView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class AdvancedMacrosView: UIView {
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    
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

extension AdvancedMacrosView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    
  }
}
