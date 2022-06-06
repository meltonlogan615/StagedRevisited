//
//  SignWithAppleButton.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import Foundation
import UIKit
// applelogo

/**
 Custom `UIButton` that when primary action triggered, advances to the next context.
 */
class SignWithAppleButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    self.isAccessibilityElement = true
    
    var config = UIButton.Configuration.filled()
    config.buttonSize = .medium
    config.imagePadding = 12
    config.imagePlacement = .trailing
    config.image = UIImage(systemName: "applelogo")
    config.baseBackgroundColor = .black
    config.baseForegroundColor = K.primary
    config.titleAlignment = .center
    config.cornerStyle = .fixed
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .systemFont(ofSize: 20, weight: .semibold)
      return outgoing
    }
    configuration = config
    
    heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
