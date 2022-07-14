//
//  AdvancedSearchRow.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit
/**
 View to show `|label      toggle|`
 
 - Vertical stack of two rows.
 
 - If either does not have values assigned, they are not rendered.
 */
class AdvancedSearchRow: UIStackView {
  let rowStack = UIStackView()
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    axis = .vertical
    spacing = 8
//    distribution = .fillProportionally
        
    rowStack.translatesAutoresizingMaskIntoConstraints = false
    rowStack.axis = .horizontal
    rowStack.distribution = .equalSpacing
    
    addArrangedSubview(rowStack)
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

