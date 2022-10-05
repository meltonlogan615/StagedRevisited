//
//  ImageButton.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 10/4/22.
//

import Foundation
import UIKit

class ImageButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    self.isAccessibilityElement = true
    
    var config = UIButton.Configuration.plain()
    config.image = UIImage(systemName: "clock")
    configuration = config

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

}

