//
//  AdvancedMicrosCell.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/28/22.
//

import Foundation
import UIKit

class AdvancedMicrosCell: UITableViewCell {
  
  let stackView: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .horizontal
//    stack.distribution = .fillProportionally
    stack.backgroundColor = .yellow
    return stack
  }()
  
  let macroLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .title3)
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.backgroundColor = .green
    return label
  }()
  
  let valueLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .title3)
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()
  
  let valueTextField: MediumTextField = {
    let field = MediumTextField()
    field.translatesAutoresizingMaskIntoConstraints = false
    field.backgroundColor = .orange
    field.textAlignment = .center
    field.placeholder = "###"
    return field
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.isAccessibilityElement = true
    self.backgroundColor = .purple
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AdvancedMicrosCell {
  func layout() {
    stackView.addArrangedSubview(macroLabel)
    stackView.addArrangedSubview(valueTextField)
    
    self.contentView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      //      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.contentView.leadingAnchor, multiplier: 2),
//      self.contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
    ])
  }
}
