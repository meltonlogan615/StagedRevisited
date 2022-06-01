//
//  AdvancedSearchRow.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class AdvancedSearchRow: UIStackView {
  let includeStack = UIStackView()
  let excludeStack = UIStackView()
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    axis = .vertical
    spacing = 8
//    distribution = .fillProportionally
    
    includeStack.translatesAutoresizingMaskIntoConstraints = false
    includeStack.axis = .horizontal
    includeStack.distribution = .equalSpacing
    
    excludeStack.translatesAutoresizingMaskIntoConstraints = false
    excludeStack.axis = .horizontal
    excludeStack.distribution = .equalSpacing
    
    addArrangedSubview(includeStack)
    addArrangedSubview(excludeStack)
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

