//
//  SummaryModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/9/22.
//

import Foundation
import UIKit

/**
 Basic view to display a seperated string  of `summary`.
 
 `summary` property value is received from and assigned via `convenience init` called in `RecipeViewController`
 */
class SummaryModal: SCModal {
  
  var summaryLabel = LargeLabel()
  var summary = String()

  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  convenience init(summary: String) {
    self.init()
    self.summary = summary
    styleSummary()
    layoutSummary()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SummaryModal {
  func styleSummary() {
    translatesAutoresizingMaskIntoConstraints = false
    
    summaryLabel.translatesAutoresizingMaskIntoConstraints = false
    summaryLabel.numberOfLines = 0
    summaryLabel.text = summary
  }
  
  func layoutSummary() {
    detailsStack.addArrangedSubview(summaryLabel)
  }
}
