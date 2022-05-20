//
//  AdvancedSearchRow.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class AdvancedSearchRow: UIStackView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    axis = .horizontal
    distribution = .equalSpacing
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

