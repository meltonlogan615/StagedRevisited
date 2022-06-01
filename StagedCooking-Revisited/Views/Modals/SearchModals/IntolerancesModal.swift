//
//  IntolerancesModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/28/22.
//

import Foundation
import UIKit

class IntolerancesModal: SCModal {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    makeLabels()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension IntolerancesModal {
  func makeLabels() {
    let stack = AdvancedSearchRow()
//    stack.translatesAutoresizingMaskIntoConstraints = false
//    stack.axis = .horizontal
//    stack.distribution = .equalSpacing
    
    for option in Intolerances.allCases {
      print(option)
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = option.rawValue.localizedCapitalized
      stack.excludeStack.addArrangedSubview(label)
      
      let toggle = ToggleSwitch()
      toggle.translatesAutoresizingMaskIntoConstraints = false
      stack.excludeStack.addArrangedSubview(toggle)
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      stack.addArrangedSubview(divider)
      
      detailsStack.addArrangedSubview(stack)
    }
  }
}
