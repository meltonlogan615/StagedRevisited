//
//  SuggestionCell.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 9/20/22.
//

import UIKit

final class SuggestionCell: UICollectionViewCell {
  
  let image: UIImageView = {
    let image = UIImageView(frame: .zero)
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFill
    image.layer.zPosition = 1
    return image
  }()
  
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
    label.font = .preferredFont(forTextStyle: .callout)
    label.textColor = K.invertPrimary
    label.textAlignment = .natural
    label.adjustsFontSizeToFitWidth = true
    label.layer.zPosition = 20
    label.numberOfLines = 0
    label.allowsDefaultTighteningForTruncation = true
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
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

extension SuggestionCell {
  
  func layout() {
    contentView.layer.cornerRadius = 8
    contentView.clipsToBounds = true
    
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
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
      titleLabel.trailingAnchor.constraint(equalTo: image.trailingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      labelBackground.bottomAnchor.constraint(equalTo: image.bottomAnchor),
      labelBackground.widthAnchor.constraint(equalTo: image.widthAnchor),
      titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: labelBackground.topAnchor, multiplier: 1)
    ])
  }
}
