//
//  ActionButton.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

import UIKit

class ActionButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    self.isAccessibilityElement = true
    
    var config = UIButton.Configuration.filled()
    config.buttonSize = .medium
    config.imagePadding = 12
    config.baseBackgroundColor = UIColor(named: "AccentColor")
    config.baseForegroundColor = UIColor(named: "SC-Primary")
    config.titleAlignment = .center
    config.cornerStyle = .fixed
    configuration = config
    
    titleLabel?.font = .systemFont(ofSize: 18)
    heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

