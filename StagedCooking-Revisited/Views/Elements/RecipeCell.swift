//
//  RecipeCell.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

protocol ReusableCell: Any {
  static var idenetifier: String { get }
}

final class RecipeCell: UICollectionViewCell {
  
  let image: UIImageView = {
    let image = UIImageView(frame: .zero)
    image.contentMode = .scaleAspectFill
    image.image = UIImage(systemName: "sun.haze.fill")
    return image
  }()
    
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.text = "Poop"
    label.numberOfLines = 0
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setup()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension RecipeCell {
  func setup() {
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 8
    // TODO: UI Improvements: contentView.layer.(shadow things
    
    image.translatesAutoresizingMaskIntoConstraints = false
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .preferredFont(forTextStyle: .title1)
    titleLabel.textAlignment = .center
    titleLabel.backgroundColor = UIColor(named: "LabelBackground")
    titleLabel.adjustsFontSizeToFitWidth = true
  }
  
  func layout() {
    contentView.addSubview(image)
    contentView.addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      image.topAnchor.constraint(equalTo: contentView.topAnchor),
      image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
    ])
    
    
    NSLayoutConstraint.activate([
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1)
    ])
  }
}
