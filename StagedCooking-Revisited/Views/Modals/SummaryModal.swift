//
//  SummaryModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/9/22.
//

// TODO: - Scrolling is currently Broken. Needs Fixed.

import Foundation
import UIKit

class SummaryModal: RecipeModal {
  
  var summaryLabel = ModalLabel()
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
//    NSLayoutConstraint.activate([
//      summaryLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1),
//      summaryLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
//      trailingAnchor.constraint(equalToSystemSpacingAfter: summaryLabel.trailingAnchor, multiplier: 1)
//    ])
  }
}
