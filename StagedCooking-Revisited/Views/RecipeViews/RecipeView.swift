//
//  RecipeHeader.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//



import Foundation
import UIKit

class RecipeView: UIView {

  var image = UIImageView()
  var ingredientsStack = UIStackView()
  var label = UILabel()
  
  var ingredients = [String]()
  
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
    
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(systemName: "brain") // will show if image is missing
    image.contentMode = .scaleAspectFill
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    
    ingredientsStack.translatesAutoresizingMaskIntoConstraints = false
    ingredientsStack.axis = .vertical
    ingredientsStack.spacing = 8
  }

  func layout() {
    addSubview(image)
    NSLayoutConstraint.activate([
      image.centerXAnchor.constraint(equalTo: centerXAnchor),
      image.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      trailingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 8),
      image.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 8),
    ])
    
    for i in 0 ..< ingredients.count {
      let ingredientLine = UILabel()
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.textColor = UIColor(named: "SC-Primary-Reversed")
      ingredientLine.font = .systemFont(ofSize: 24)
      ingredientLine.numberOfLines = 0
      ingredientLine.text = ingredients[i].capitalized
      ingredientsStack.addArrangedSubview(ingredientLine)
    }
    
    addSubview(ingredientsStack)
    NSLayoutConstraint.activate([
      ingredientsStack.topAnchor.constraint(equalToSystemSpacingBelow: image.bottomAnchor, multiplier: 2),
      ingredientsStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      ingredientsStack.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
    
  }
}
