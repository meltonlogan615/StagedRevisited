//
//  DetailsButton.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

/**
 Custom `UIButton` that when primary action triggered, displays additional information within the same context.
 */

class DetailsButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    self.isAccessibilityElement = true
    var config = UIButton.Configuration.filled()
    config.baseForegroundColor = K.primary
    config.imagePadding = 16
    config.cornerStyle = .fixed
    config.titleAlignment = .leading
//    config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .preferredFont(forTextStyle: .title2)
      return outgoing
    }
    configuration = config
    heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

