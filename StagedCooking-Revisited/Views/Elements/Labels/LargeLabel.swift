//
//  LargeLabel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/25/22.
//

import Foundation
import UIKit

class LargeLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LargeLabel {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    font = .systemFont(ofSize: 20)
    numberOfLines = 0
    tintColor = K.invertPrimary
  }
}
