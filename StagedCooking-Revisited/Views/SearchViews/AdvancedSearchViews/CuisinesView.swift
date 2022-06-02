//
//  CuisinesView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/28/22.
//

import Foundation
import UIKit
/**
 View to show a list of available `Cuisine`s to filter for and `toggleSwitch`es to either add or exclude them from the search parameters.
 */
class CuisinesView: AdvancedSearch {
  
  var includeArray = [Cuisine]()
  var excludeArray = [Cuisine]()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    layoutCuisines()
    for option in Cuisine.allCases {
      allOptions.append("Include \(option.rawValue)")
      allOptions.append("Exclude \(option.rawValue)")
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CuisinesView {
  func layoutCuisines() {
    var includeRowTag = 0
    var excludeRowTag = 1
    for option in Cuisine.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let includeTitle = LargeLabel()
      includeTitle.translatesAutoresizingMaskIntoConstraints = false
      includeTitle.text = "Include \(option.rawValue.localizedCapitalized)"
      includeTitle.tag = includeRowTag
      
      let includeToggle = ToggleSwitch()
      includeToggle.translatesAutoresizingMaskIntoConstraints = false
      includeToggle.tag = includeRowTag
      includeToggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)
      
      // maybe?
      let dividerOne = Divider()
      dividerOne.translatesAutoresizingMaskIntoConstraints = false
      
      let excludetitle = LargeLabel()
      excludetitle.translatesAutoresizingMaskIntoConstraints = false
      excludetitle.text = "Exclude \(option.rawValue.localizedCapitalized)"
      
      let excludeToggle = ToggleSwitch()
      excludeToggle.translatesAutoresizingMaskIntoConstraints = false
      excludeToggle.tag = excludeRowTag
      excludeToggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)
      
      let dividerTwo = Divider()
      dividerTwo.translatesAutoresizingMaskIntoConstraints = false
      
      row.includeStack.addArrangedSubview(includeTitle)
      row.includeStack.addArrangedSubview(includeToggle)
      
      row.excludeStack.addArrangedSubview(excludetitle)
      row.excludeStack.addArrangedSubview(excludeToggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(dividerTwo)
      includeRowTag += 2
      excludeRowTag += 2
    }
  }
}





