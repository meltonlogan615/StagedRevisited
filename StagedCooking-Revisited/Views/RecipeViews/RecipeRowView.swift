//
//  RecipeRowView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/7/22.
//

import UIKit

class RecipeRowView: UIView {
  
  let row = UIStackView()
  let imageRow = UIStackView()
  let icon = UIImageView()
  let sign = UIImageView()
  let size = CGSize(width: 32, height: 28)
  let disclosure = UIImageView()

  let label = SCLabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension RecipeRowView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    row.translatesAutoresizingMaskIntoConstraints = false
    row.axis = .horizontal
    row.spacing = 4
    row.distribution = .fillProportionally
    

    
    icon.translatesAutoresizingMaskIntoConstraints = false
    icon.tintColor = K.invertPrimary
    icon.frame.size = size
  
    
    sign.translatesAutoresizingMaskIntoConstraints = false
    sign.tintColor = K.invertPrimary
    sign.frame.size = size
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = K.invertPrimary
    label.numberOfLines = 1
    label.lineBreakStrategy = .standard
    
    disclosure.translatesAutoresizingMaskIntoConstraints = false
    disclosure.tintColor = K.scAccent
    disclosure.frame.size = size
    disclosure.image = UIImage(systemName: "info.circle")
    disclosure.isHidden = true
  }
  
  func layout() {
    row.addArrangedSubview(icon)
    row.addArrangedSubview(sign)
    row.addArrangedSubview(imageRow)
    
    addSubview(row)
    NSLayoutConstraint.activate([
      row.topAnchor.constraint(equalTo: topAnchor),
      row.leadingAnchor.constraint(equalTo: leadingAnchor),
      row.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
    
    addSubview(label)
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: row.topAnchor),
      label.leadingAnchor.constraint(equalToSystemSpacingAfter: row.trailingAnchor, multiplier: 1),
      label.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }
}
