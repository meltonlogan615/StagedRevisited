//
//  MacrosModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/9/22.
//

import Foundation
import UIKit

/**
 Basic view to display a list  of `macros`.
 
 `macros` property value is received from and assigned via `convenience init` called in `RecipeViewController`
 
  `MacrosLabelView` is used to provide consistent formatting and additional flexibility if needed.
 */
class MacrosModal: SCModal {
  
  var macros = [Macros]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  } 
  
  convenience init(macros: [Macros]) {
    self.init()
    self.macros = macros
    generateMacrosLabels()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MacrosModal {
  func generateMacrosLabels() {
    for i in 0 ..< macros.count {
      let macrosLabel = MacrosLabelView()
      macrosLabel.translatesAutoresizingMaskIntoConstraints = false
      macrosLabel.titleLabel.text = macros[i].name.capitalized + ":"
      macrosLabel.amountLabel.text = "\(macros[i].amount)\(macros[i].unit)"
      macrosLabel.dailyPercentLabel.text = "\(macros[i].percentOfDailyNeeds)% of Daily Needs"
      detailsStack.addArrangedSubview(macrosLabel)
    }
  }
}


