//
//  StagedCardViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/13/22.
//

import Foundation
import UIKit

class StagedCardViewController: UIViewController {
  
// MARK: - Views
  let stepView = UIView()
  let cardStackView = UIStackView()
  let dividerView = UIView()
  let dividerViewSequel = UIView()
  
//  MARK: - Labels
  let cardNumberLabel = UILabel()
  var ingredientLabel = UILabel()
  let directionsLabel = UILabel()
  
//  MARK: = VC Data
  var recipeName = String()
  var cardCounter = Int()
  var ingredients = [String]()
  var directions = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
  
  init(recipeName: String, cardCounter: Int, ingredients: [String], instructions: String) {
    self.cardNumberLabel.text = "Stage \(cardCounter)"
    self.directionsLabel.text = "\(instructions)"
    self.cardCounter = cardCounter
    self.ingredients = ingredients
    self.directions = instructions
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension StagedCardViewController {
  
  func style() {
    view.backgroundColor = UIColor(named: "SC-Primary")
    
    stepView.translatesAutoresizingMaskIntoConstraints = false
    stepView.backgroundColor = UIColor(named: "SC-Primary")
    stepView.layer.borderWidth = 2
    stepView.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
    stepView.layer.cornerRadius = 8
    stepView.clipsToBounds = true
    
    cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    cardNumberLabel.font = .preferredFont(forTextStyle: .title1)
    cardNumberLabel.textColor = UIColor(named: "SC-Primary-Reversed")
    cardNumberLabel.textAlignment = .center
    
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    dividerView.backgroundColor = UIColor(named: "AccentColor")
    
    cardStackView.translatesAutoresizingMaskIntoConstraints = false
    cardStackView.axis = .vertical
    cardStackView.distribution = .fillProportionally
    cardStackView.spacing = 8
    
    dividerViewSequel.translatesAutoresizingMaskIntoConstraints = false
    dividerViewSequel.backgroundColor = UIColor(named: "AccentColor")
    
    directionsLabel.translatesAutoresizingMaskIntoConstraints = false
    directionsLabel.textColor = UIColor(named: "SC-Primary-Reversed")
    directionsLabel.numberOfLines = 0
    directionsLabel.font = .systemFont(ofSize: 20)
    directionsLabel.adjustsFontSizeToFitWidth = true
    
  }
  
  func layout() {
    view.addSubview(stepView)
    NSLayoutConstraint.activate([
      stepView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
      stepView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stepView.trailingAnchor, multiplier: 4),
      stepView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4)
    ])
    
    stepView.addSubview(cardNumberLabel)
    NSLayoutConstraint.activate([
      cardNumberLabel.widthAnchor.constraint(equalTo: stepView.widthAnchor),
      cardNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: stepView.topAnchor, multiplier: 1),
      cardNumberLabel.heightAnchor.constraint(equalToConstant: 40)
    ])
    
    stepView.addSubview(dividerView)
    NSLayoutConstraint.activate([
      dividerView.heightAnchor.constraint(equalToConstant: 2),
      dividerView.topAnchor.constraint(equalToSystemSpacingBelow: cardNumberLabel.bottomAnchor, multiplier: 1),
      stepView.trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 4),
      dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: stepView.leadingAnchor, multiplier: 4)
    ])
    
    if ingredients.isEmpty {
      let ingredientLine = UILabel()
      cardStackView.addArrangedSubview(ingredientLine)
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.numberOfLines = 0
      ingredientLine.text = "No Ingredients Used"
      ingredientLine.font = .systemFont(ofSize: 20)
    } else {
      for i in 0 ..< ingredients.count {
        let ingredientLine = UILabel()
        cardStackView.addArrangedSubview(ingredientLine)
        ingredientLine.translatesAutoresizingMaskIntoConstraints = false
        ingredientLine.numberOfLines = 0
        ingredientLine.text = ingredients[i].capitalized
        ingredientLine.font = .systemFont(ofSize: 20)
      }
    }
    
    stepView.addSubview(cardStackView)
    NSLayoutConstraint.activate([
      cardStackView.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2),
      stepView.trailingAnchor.constraint(equalToSystemSpacingAfter: cardStackView.trailingAnchor, multiplier: 2),
      cardStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stepView.leadingAnchor, multiplier: 2),
      cardStackView.centerXAnchor.constraint(equalTo: stepView.centerXAnchor),
    ])
    
    stepView.addSubview(dividerViewSequel)
    NSLayoutConstraint.activate([
      dividerViewSequel.heightAnchor.constraint(equalToConstant: 2),
      dividerViewSequel.topAnchor.constraint(equalToSystemSpacingBelow: cardStackView.bottomAnchor, multiplier: 2),
      dividerViewSequel.widthAnchor.constraint(equalTo: dividerView.widthAnchor),
      dividerViewSequel.centerXAnchor.constraint(equalTo: stepView.centerXAnchor)
    ])
    
    stepView.addSubview(directionsLabel)
    NSLayoutConstraint.activate([
      directionsLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerViewSequel.bottomAnchor, multiplier: 2),
      directionsLabel.trailingAnchor.constraint(equalTo: cardStackView.trailingAnchor),
      directionsLabel.leadingAnchor.constraint(equalTo: cardStackView.leadingAnchor),
    ])
  }
}

