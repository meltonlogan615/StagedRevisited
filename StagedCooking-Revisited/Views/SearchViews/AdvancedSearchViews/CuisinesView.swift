//
//  CuisinesView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/20/22.
//

import Foundation
import UIKit

class CuisinesView: AdvancedSearch {
  
  var cuisines = [Cuisine]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .blue
    styleCuisines()
    layoutCuisines()
  }
  
  convenience init(cuisine: [Cuisine]) {
    self.init()
    self.cuisines = cuisine
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CuisinesView {
  
  func styleCuisines() {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layoutCuisines() {
    for option in Cuisine.allCases {
      
      print("---")
      let row = AdvancedSearchRow()
//      row.backgroundColor = .red
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let rowTitle = ModalLabel()
      rowTitle.translatesAutoresizingMaskIntoConstraints = false
      
      let toggle = UISwitch()
      toggle.translatesAutoresizingMaskIntoConstraints = false
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      rowTitle.text = option.rawValue.localizedCapitalized
      print(String(describing: option.rawValue.localizedCapitalized))
      
      row.addArrangedSubview(rowTitle)
      row.addArrangedSubview(toggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
    }
    print(String(describing: detailsStack.frame))

  }
}
