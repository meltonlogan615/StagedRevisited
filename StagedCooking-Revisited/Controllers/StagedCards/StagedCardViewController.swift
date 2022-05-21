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
  let scrollView = UIScrollView()
  let stepView = UIView()
  let cardStackView = UIStackView()
  
  let dividerView = Divider()
  let dividerViewSequel = Divider()
  
//  MARK: - Labels
  let cardNumberLabel = UILabel()
  var ingredientLabel = UILabel()
  let directionsLabel = ModalLabel()
  
//  MARK: = VC Data
  var recipeName = String()
  var cardCounter = Int()
  var ingredients = [String]()
  var directions = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    style()
    layout()
  }
  
  init(recipeName: String, cardCounter: Int, ingredients: [String], instructions: String) {
    self.cardNumberLabel.text = "Stage \(cardCounter)"
    self.directionsLabel.text = "\(instructions)\n \n\(instructions)\n\n \(instructions)\n\n\(instructions)"
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
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = K.primary
    scrollView.layer.borderWidth = 2
    scrollView.layer.borderColor = K.scAccent?.cgColor
    scrollView.layer.cornerRadius = 8
    scrollView.clipsToBounds = true
    
    stepView.translatesAutoresizingMaskIntoConstraints = false
    
    cardStackView.translatesAutoresizingMaskIntoConstraints = false
    cardStackView.axis = .vertical
    cardStackView.distribution = .fillProportionally
    cardStackView.spacing = 8
    
    cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    cardNumberLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    cardNumberLabel.textColor = K.invertPrimary
    cardNumberLabel.textAlignment = .center
    
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    // ingredients
    dividerViewSequel.translatesAutoresizingMaskIntoConstraints = false
    
    directionsLabel.translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  func layout() {
    view.addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
      scrollView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 6),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: scrollView.trailingAnchor, multiplier: 6),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 18),
    ])
    
    scrollView.addSubview(stepView)
    NSLayoutConstraint.activate([
      stepView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stepView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stepView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stepView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stepView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    
    stepView.addSubview(cardStackView)
    NSLayoutConstraint.activate([
      cardStackView.topAnchor.constraint(equalToSystemSpacingBelow: stepView.topAnchor, multiplier: 2),
      stepView.trailingAnchor.constraint(equalToSystemSpacingAfter: cardStackView.trailingAnchor, multiplier: 2),
      cardStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stepView.leadingAnchor, multiplier: 2),
    ])
    
    cardStackView.addArrangedSubview(cardNumberLabel)
    cardStackView.addArrangedSubview(dividerView)
    
    if ingredients.isEmpty {
      let ingredientLine = ModalLabel()
      cardStackView.addArrangedSubview(ingredientLine)
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.text = "No Ingredients Used"
    } else {
      for i in 0 ..< ingredients.count {
        let ingredientLine = ModalLabel()
        cardStackView.addArrangedSubview(ingredientLine)
        ingredientLine.translatesAutoresizingMaskIntoConstraints = false
        ingredientLine.text = ingredients[i].capitalized
      }
    }
    
    cardStackView.addArrangedSubview(dividerViewSequel)
    cardStackView.addArrangedSubview(directionsLabel)

  }
}

