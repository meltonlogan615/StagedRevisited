//
//  SettingsButton.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/15/22.
//

import Foundation
import UIKit

class SettingsButton: UIButton {
  
  var itemLabel = LargeLabel()
  var valueLabel = SCLabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsButton {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    isAccessibilityElement = true
  }
  
  func layout() {
    var config = UIButton.Configuration.bordered()
    config.attributedSubtitle = "FATTY"
    config.attributedSubtitle?.backgroundColor = .blue
    config.baseForegroundColor = K.primary
    config.baseBackgroundColor = K.scAccent
    config.cornerStyle = .fixed
    config.titleAlignment = .center
    //    config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .preferredFont(forTextStyle: .title2)
      return outgoing
    }
    configuration = config
  }
}
