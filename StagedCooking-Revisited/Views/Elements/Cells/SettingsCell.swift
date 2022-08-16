//
//  SettingsCell.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/27/22.
//

import Foundation

import Foundation
import UIKit

class SettingsCell: UICollectionViewCell {
  
  let cellLabel: LargeLabel = {
    let label = LargeLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = K.invertPrimary
    label.textAlignment = .center
    label.adjustsFontSizeToFitWidth = true
    label.numberOfLines = 0
    label.allowsDefaultTighteningForTruncation = true
    return label
  }()
  
  let image: UIImageView = {
    let img = UIImageView()
    img.translatesAutoresizingMaskIntoConstraints = false
    img.image = UIImage(systemName: "chevron.right")
    img.tintColor = K.invertPrimary
    return img
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension SettingsCell {
  
  func layout() {
    contentView.backgroundColor = K.modalBG
    contentView.layer.cornerRadius = 8
    contentView.clipsToBounds = true

    contentView.addSubview(cellLabel)
    NSLayoutConstraint.activate([
      cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      cellLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ])
    
    contentView.addSubview(image)
    NSLayoutConstraint.activate([
      image.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 2),
//      image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: image.bottomAnchor, multiplier: 2),
    ])
    
  }
}
