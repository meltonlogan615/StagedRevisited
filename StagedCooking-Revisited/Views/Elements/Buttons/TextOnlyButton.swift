//
//  TextOnlyButton.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import Foundation
import UIKit

class TextOnlyButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    self.isAccessibilityElement = true
    
    var config = UIButton.Configuration.borderless()
    config.buttonSize = .medium
    config.imagePadding = 12
    config.baseForegroundColor = K.scAccent
    config.titleAlignment = .center
    config.cornerStyle = .fixed
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .systemFont(ofSize: 20, weight: .regular)
      return outgoing
    }
    configuration = config
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
