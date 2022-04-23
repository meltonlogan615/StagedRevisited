//
//  StagedCardViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/13/22.
//

import Foundation
import UIKit

class StagedCardViewController: UIViewController {
    
  let stepView = UIView()
  let cardStackView = UIStackView()
  let cardNumberLabel = UILabel()
  var ingredientLabel = UILabel()
  let directionsLabel = UILabel()
  
  var recipeName = String()
  var cardCounter = Int()
  var ingredient = String()
  var ingredients = [String]()
  var directions = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
  
  init(recipeName: String, cardCounter: Int, ingredients: [String], instructions: String) {
    self.cardNumberLabel.text = "Step \(cardCounter)"
    self.directionsLabel.text = "\(instructions)"
    self.cardCounter = cardCounter
    self.ingredients = ingredients
    self.directions = instructions
    print("Ingredients #\(cardCounter):", ingredients, "")
    print("Instruction #\(cardCounter):", instructions, "\n")
    super.init(nibName: nil, bundle: nil)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


extension StagedCardViewController {
  
  func style() {
    view.backgroundColor = .lightGray
    
    stepView.translatesAutoresizingMaskIntoConstraints = false
    stepView.layer.borderWidth = 2
    stepView.layer.borderColor = UIColor(named: "black")?.cgColor
    stepView.layer.cornerRadius = 8
    stepView.clipsToBounds = true
    
    cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    cardNumberLabel.font = .preferredFont(forTextStyle: .largeTitle)
    cardNumberLabel.textAlignment = .center
    
    cardStackView.translatesAutoresizingMaskIntoConstraints = false
    cardStackView.axis = .vertical
    cardStackView.distribution = .fillProportionally
    cardStackView.spacing = 16
    
    ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
    ingredientLabel.font = .systemFont(ofSize: 24)
    
    directionsLabel.translatesAutoresizingMaskIntoConstraints = false
    directionsLabel.numberOfLines = 0
    directionsLabel.font = .systemFont(ofSize: 24)
  }
  
  func layout() {
    view.addSubview(stepView)
    NSLayoutConstraint.activate([
      stepView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      stepView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stepView.trailingAnchor, multiplier: 2),
      stepView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
    ])
    
    stepView.addSubview(cardNumberLabel)
    NSLayoutConstraint.activate([
      cardNumberLabel.widthAnchor.constraint(equalTo: stepView.widthAnchor),
      cardNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: stepView.topAnchor, multiplier: 1),
      cardNumberLabel.heightAnchor.constraint(equalToConstant: 40)
    ])
    
    for i in 0 ..< ingredients.count {
      let ingredientLine = UILabel()
      cardStackView.addArrangedSubview(ingredientLine)
      ingredientLine.text = ingredients[i].capitalized
      
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.font = .systemFont(ofSize: 24)

    }
    
    view.addSubview(cardStackView)
    NSLayoutConstraint.activate([
      cardStackView.topAnchor.constraint(equalToSystemSpacingBelow: cardNumberLabel.bottomAnchor, multiplier: 2),
      stepView.trailingAnchor.constraint(equalToSystemSpacingAfter: cardStackView.trailingAnchor, multiplier: 2),
      cardStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stepView.leadingAnchor, multiplier: 2),
      cardStackView.centerXAnchor.constraint(equalTo: stepView.centerXAnchor),
    ])
    
    stepView.addSubview(directionsLabel)
    NSLayoutConstraint.activate([
      directionsLabel.topAnchor.constraint(equalToSystemSpacingBelow: cardStackView.bottomAnchor, multiplier: 4),
      directionsLabel.trailingAnchor.constraint(equalTo: cardStackView.trailingAnchor),
      directionsLabel.leadingAnchor.constraint(equalTo: cardStackView.leadingAnchor),
    ])
  }
}

