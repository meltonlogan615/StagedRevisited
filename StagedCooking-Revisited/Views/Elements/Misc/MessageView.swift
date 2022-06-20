//
//  MessageView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/17/22.
//

import Foundation
import UIKit

class MessageView: UIView {
  
  let message = LargeLabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = K.modalBG
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MessageView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    message.translatesAutoresizingMaskIntoConstraints = false
    message.numberOfLines = 0
    message.textColor = K.invertPrimary
    message.textAlignment = .center
  }
  
  func layout() {
    addSubview(message)
    NSLayoutConstraint.activate([
      message.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      message.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      trailingAnchor.constraint(equalToSystemSpacingAfter: message.trailingAnchor, multiplier: 2),
      bottomAnchor.constraint(equalToSystemSpacingBelow: message.bottomAnchor, multiplier: 1)
    ])
  }
}
