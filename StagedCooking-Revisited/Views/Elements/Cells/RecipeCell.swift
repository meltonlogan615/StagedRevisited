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

/**
 Custom `UICollectionViewCell` used to display `recipe.image` & `recipe.title`
 
 - Current only used in `RecipeListCollectionView`
 */
final class RecipeCell: UICollectionViewListCell {
  
  /// Fills the entire cell
  let image: UIImageView = {
    let image = UIImageView(frame: .zero)
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    image.image = UIImage(named: "hotchiken")
    image.layer.zPosition = 1
    image.backgroundColor = .orange
    return image
  }()
  
  /// The background of the `UILabel`. Needed to provide adequate contrast.
  let labelBackground: UIView = {
    let labelBackground = UIView()
    labelBackground.translatesAutoresizingMaskIntoConstraints = false
    labelBackground.backgroundColor = K.scLabelBG
    labelBackground.layer.zPosition = 10
    return labelBackground
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .title2)
    label.textColor = K.invertPrimary
    label.textAlignment = .center
    label.adjustsFontSizeToFitWidth = false
    label.layer.zPosition = 20
    label.numberOfLines = 2
    label.allowsDefaultTighteningForTruncation = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    layer.borderWidth = 2
    layer.borderColor = K.primary?.cgColor
    layer.zPosition = 10
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    self.image.image = UIImage()
    self.titleLabel.text = ""
  }
}

extension RecipeCell {
  
  func layout() {
    contentView.addSubview(image)
    contentView.addSubview(labelBackground)
    contentView.addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      image.topAnchor.constraint(equalTo: contentView.topAnchor),
      image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: image.leadingAnchor, multiplier: 1),
      image.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1),
    ])

    NSLayoutConstraint.activate([
      labelBackground.bottomAnchor.constraint(equalTo: image.bottomAnchor),
      labelBackground.widthAnchor.constraint(equalTo: image.widthAnchor),
      titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: labelBackground.topAnchor, multiplier: 1)
    ])
  }
}


