//
//  StagedCardView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/13/22.
//

import Foundation
import UIKit

class StagedCardView: UIView {
  
  let cardStackView = UIStackView()
  let cardNumberLabel = UILabel()
  let ingredientLabel = UILabel()
  let directionsLabel = UILabel()
    
  var recipeName = String()
  var cardCounter = Int()
  var ingredient = String()
  var ingredients = [String]()
  var directions = String()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    print("View Ingredients:\n", ingredients)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension StagedCardView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    cardNumberLabel.font = .preferredFont(forTextStyle: .largeTitle)
    cardNumberLabel.text = ("\(recipeName) Stage \(cardCounter)")
    cardNumberLabel.textAlignment = .center
    
    cardStackView.translatesAutoresizingMaskIntoConstraints = false
    cardStackView.axis = .vertical
    cardStackView.distribution = .fillProportionally
    cardStackView.spacing = 36

    ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
//    ingredientLabel.text = ingredient
    ingredientLabel.numberOfLines = 0
    ingredientLabel.font = .systemFont(ofSize: 24)
    
    directionsLabel.translatesAutoresizingMaskIntoConstraints = false
    directionsLabel.numberOfLines = 0
    directionsLabel.text = directions
    directionsLabel.font = .systemFont(ofSize: 24)
    
  }
  
  func layout() {
    addSubview(cardNumberLabel)
    NSLayoutConstraint.activate([
      cardNumberLabel.widthAnchor.constraint(equalTo: widthAnchor),
      cardNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      cardNumberLabel.heightAnchor.constraint(equalToConstant: 40)
    ])
    
    // TODO: - Replace defined Loop with results of network call
    for i in 0 ..< ingredients.count {
      let ingredient = ingredients[i]
      ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
      ingredientLabel.text = ingredient
      cardStackView.addArrangedSubview(ingredientLabel)
    }
    
    cardStackView.addArrangedSubview(directionsLabel)
    
    addSubview(cardStackView)
    NSLayoutConstraint.activate([
      cardStackView.topAnchor.constraint(equalToSystemSpacingBelow: cardNumberLabel.bottomAnchor, multiplier: 4),
      trailingAnchor.constraint(equalToSystemSpacingAfter: cardStackView.trailingAnchor, multiplier: 2),
      cardStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      cardStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      cardStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
