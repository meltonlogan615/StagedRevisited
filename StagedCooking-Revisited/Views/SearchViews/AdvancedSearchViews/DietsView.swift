//
//  DietsView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class DietsView: AdvancedSearch {
  
  var diets = Diet(rawValue: "Omnivore")
  
  let dietLabel = UILabel()
  
  let addDietsButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension DietsView {
  
  func styleDietsView() {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layoutDietsView() {
    
  }
}
