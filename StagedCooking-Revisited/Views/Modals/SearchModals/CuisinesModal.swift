//
//  CuisinesModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/28/22.
//

import Foundation
import UIKit

class CuisinesModal: SCModal {
  
  var includeArray = [Cuisine]()
  var excludeArray = [Cuisine]()
  var allOptions = [String]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    makeLabels()
    for option in Cuisine.allCases {
      allOptions.append("Include \(option.rawValue)")
      allOptions.append("Exclude \(option.rawValue)")
    }

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension CuisinesModal {
  func makeLabels() {
    var includeRowTag = 0
    var excludeRowTag = 1
    for option in Cuisine.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let includeTitle = SCLabel()
      includeTitle.translatesAutoresizingMaskIntoConstraints = false
      includeTitle.text = "Include \(option.rawValue.localizedCapitalized)"
      includeTitle.tag = includeRowTag
      
      let excludetitle = SCLabel()
      excludetitle.translatesAutoresizingMaskIntoConstraints = false
      excludetitle.text = "Exclude \(option.rawValue.localizedCapitalized)"
      excludetitle.tag = excludeRowTag
      
      let includeToggle = ToggleSwitch()
      includeToggle.translatesAutoresizingMaskIntoConstraints = false
      includeToggle.tag = includeRowTag
      includeToggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)
      
      let excludeToggle = ToggleSwitch()
      excludeToggle.translatesAutoresizingMaskIntoConstraints = false
      excludeToggle.tag = excludeRowTag
      excludeToggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
//      includeRowTag += 1

      
      row.includeStack.addArrangedSubview(includeTitle)
      row.includeStack.addArrangedSubview(includeToggle)
      
      row.excludeStack.addArrangedSubview(excludetitle)
      row.excludeStack.addArrangedSubview(excludeToggle)
      
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      includeRowTag += 2
      excludeRowTag += 2
    }
  }
}

extension CuisinesModal {
  @objc func didToggle(_ sender: UISwitch) {
    print(allOptions[sender.tag])
  }
}



