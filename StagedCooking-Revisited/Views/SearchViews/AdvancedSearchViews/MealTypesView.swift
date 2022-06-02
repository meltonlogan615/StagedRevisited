//
//  MealTypesView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/30/22.
//

import Foundation
import UIKit

/**
 View to show a list of available `MealTypes`s to filter for and `toggleSwitch`es, which, if are on, will only show recipes that conform to the assocaited selection.
 */
class MealTypesView: AdvancedSearch {
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    for option in MealType.allCases {
      allOptions.append(option.rawValue)
    }
    layoutMealTypes()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MealTypesView {
  func layoutMealTypes() {
    var rowTag = 0
    for option in MealType.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let includeLabel = LargeLabel()
      includeLabel.translatesAutoresizingMaskIntoConstraints = false
      includeLabel.text = option.rawValue.localizedCapitalized
      includeLabel.tag = rowTag
      
      let includeToggle = ToggleSwitch()
      includeToggle.translatesAutoresizingMaskIntoConstraints = false
      includeToggle.tag = rowTag
      includeToggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.includeStack.addArrangedSubview(includeLabel)
      row.includeStack.addArrangedSubview(includeToggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)

      rowTag += 1
    }
  }
}
