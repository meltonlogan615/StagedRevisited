//
//  AdvancedMicrosCell.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/28/22.
//

import Foundation
import UIKit

class AdvancedMicrosCell: UITableViewCell {
    
  let macroLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .title3)
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
//    label.backgroundColor = .green
    return label
  }()
  
  let valueLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .title3)
    return label
  }()
  
//  let valueTextField: MediumTextField = {
//    let field = MediumTextField()
//    field.translatesAutoresizingMaskIntoConstraints = false
//    field.backgroundColor = .orange
//    field.textAlignment = .center
//    field.placeholder = "###"
//    return field
//  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.isAccessibilityElement = true
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AdvancedMicrosCell {
  func layout() {
    addSubview(macroLabel)
    NSLayoutConstraint.activate([
      macroLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      macroLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
    ])
    
    addSubview(valueLabel)
    NSLayoutConstraint.activate([
      valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      trailingAnchor.constraint(equalToSystemSpacingAfter: valueLabel.trailingAnchor, multiplier: 2),
    ])

  }
}
