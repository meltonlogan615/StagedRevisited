//
//  SCLabel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/13/22.
//

import Foundation
import UIKit
/**
 Custom UILabel to ensure consistent styling throughout the app.
 */
class SCLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SCLabel {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    numberOfLines = 0
    tintColor = K.invertPrimary
  }
}
