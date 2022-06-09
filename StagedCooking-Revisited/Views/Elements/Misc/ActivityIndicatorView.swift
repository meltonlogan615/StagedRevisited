//
//  ActivityIndicatorView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/8/22.
//

import Foundation
import UIKit

class ActivityIndicatorView: UIActivityIndicatorView {
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension ActivityIndicatorView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    
  }
}

