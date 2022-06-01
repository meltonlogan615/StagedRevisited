//
//  IntolerancesView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class IntolerancesView: AdvancedSearch {
      
  override init(frame: CGRect) {
    super.init(frame: frame)
    for option in Intolerances.allCases {
      allOptions.append(option.rawValue)
    }
    layoutIntolerances()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension IntolerancesView {
  private func layoutIntolerances() {
    var rowTag = 0
    for option in Intolerances.allCases {
      let row = AdvancedSearchRow()
      
      let rowLabel = LargeLabel()
      rowLabel.translatesAutoresizingMaskIntoConstraints = false
      rowLabel.text = option.rawValue.localizedCapitalized
      rowLabel.tag = rowTag
      
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
