//
//  DietsView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit
/**
 View to show a list of available `Diet`s to filter for and `toggleSwitch`es, which, if are on, will only show recipes that conform to the assocaited selection.

 */
class DietsView: AdvancedSearch {
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    for option in Diet.allCases {
      allOptions.append(option.rawValue)
    }
    layoutDiets()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension DietsView {

  func layoutDiets() {
    var rowTag = 0
    for option in Diet.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let rowLabel = LargeLabel()
      rowLabel.translatesAutoresizingMaskIntoConstraints = false
      rowLabel.text = option.rawValue.localizedCapitalized
      
      let excludeToggle = ToggleSwitch()
      excludeToggle.translatesAutoresizingMaskIntoConstraints = false
      excludeToggle.tag = rowTag
      excludeToggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)

      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.excludeStack.addArrangedSubview(rowLabel)
      row.excludeStack.addArrangedSubview(excludeToggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 1
    }
  }
}
