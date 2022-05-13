//
//  MacrosLabelView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit

class MacrosLabelView: UIView {
  
  var titleLabel = UILabel()
  var amountLabel = UILabel()
  var dailyPercentLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension MacrosLabelView {
  
  func style() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    
    amountLabel.translatesAutoresizingMaskIntoConstraints = false
    amountLabel.font = .systemFont(ofSize: 20)
    
    dailyPercentLabel.translatesAutoresizingMaskIntoConstraints = false
    dailyPercentLabel.font = .systemFont(ofSize: 20)
    dailyPercentLabel.numberOfLines = 0
  }
  
  func layout() {
    addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
    
    addSubview(amountLabel)
    NSLayoutConstraint.activate([
      amountLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
      amountLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
//      amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
    
    addSubview(dailyPercentLabel)
    NSLayoutConstraint.activate([
      dailyPercentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      dailyPercentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      dailyPercentLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      dailyPercentLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

  }
}
