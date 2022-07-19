//
//  MacrosLabelView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit
/**
 Custom `UIView` holding several `UILabels` used to display Macronutrients in a consistent way while minimizing code duplication.
 */
class MacrosLabelView: UIView {
  
  let hStack = UIStackView()
  let vStack = UIStackView()
  
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
    vStack.translatesAutoresizingMaskIntoConstraints = false
    vStack.axis = .vertical
    vStack.spacing = 2
    
    hStack.translatesAutoresizingMaskIntoConstraints = false
    hStack.axis = .horizontal
    hStack.distribution = .equalSpacing
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    
    amountLabel.translatesAutoresizingMaskIntoConstraints = false
    amountLabel.font = .systemFont(ofSize: 20)
    
    dailyPercentLabel.translatesAutoresizingMaskIntoConstraints = false
    dailyPercentLabel.font = .systemFont(ofSize: 20)
    dailyPercentLabel.numberOfLines = 0
  }
  
  func layout() {
    hStack.addArrangedSubview(titleLabel)
    hStack.addArrangedSubview(amountLabel)
    
    vStack.addArrangedSubview(hStack)
    vStack.addArrangedSubview(dailyPercentLabel)
    
    addSubview(vStack)
    NSLayoutConstraint.activate([
      vStack.topAnchor.constraint(equalTo: topAnchor),
      vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      vStack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
