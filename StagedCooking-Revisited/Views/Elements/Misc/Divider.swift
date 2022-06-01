//
//  Divider.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/7/22.
//

import Foundation
import UIKit
/**
 Horizontal `AccentColored` bar to act as a seperator between elements.
 */
class Divider: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension Divider {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = K.scAccent
    heightAnchor.constraint(equalToConstant: 2).isActive = true
  }
}
