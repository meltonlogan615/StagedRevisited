//
//  RecipeHeader.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

class RecipeView: UIView {

  var recipeStack = UIStackView()
  var image = UIImageView()
  var label = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension RecipeView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .blue // Debuggin
    
    recipeStack.translatesAutoresizingMaskIntoConstraints = false
//    recipeStack.axis = .vertical
//    recipeStack.distribution = .fill

    recipeStack.backgroundColor = .orange // Debuggin
//    recipeStack.frame.size = CGSize(width: 100, height: 100)
//    image.frame.size = CGSize(width: 10, height: 10)

    
    image.backgroundColor = .green // Debuggin
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "hotchiken") // Debuggin
    image.contentMode = .scaleAspectFit
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    
    label.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
//    addSubview(image)
//    NSLayoutConstraint.activate([
//      image.centerXAnchor.constraint(equalTo: centerXAnchor),
//      image.centerYAnchor.constraint(equalTo: centerYAnchor),
//      trailingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 8),
//      image.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 8)
//    ])
    
    recipeStack.addArrangedSubview(image)
//    recipeStack.addArrangedSubview(label)
    
    addSubview(recipeStack)

    NSLayoutConstraint.activate([
      recipeStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      trailingAnchor.constraint(equalToSystemSpacingAfter: recipeStack.trailingAnchor, multiplier: 4),
      bottomAnchor.constraint(equalTo: recipeStack.bottomAnchor),
      recipeStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
    ])

    NSLayoutConstraint.activate([
//      image.centerXAnchor.constraint(equalTo: recipeStack.centerXAnchor),
//      image.centerYAnchor.constraint(equalTo: recipeStack.centerYAnchor),
//      recipeStack.trailingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 8),
//      image.leadingAnchor.constraint(equalToSystemSpacingAfter: recipeStack.leadingAnchor, multiplier: 8)
    ])
    print(recipeStack.frame.height, recipeStack.frame.width)
    print(image.frame.height, image.frame.width)
    
//    addSubview(label)
    
//    NSLayoutConstraint.activate([
//      label.centerXAnchor.constraint(equalTo: centerXAnchor),
//      label.centerYAnchor.constraint(equalTo: centerYAnchor)
//    ])
    
  }
}
