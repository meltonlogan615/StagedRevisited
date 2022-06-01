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
  let cardView = UIView()
  let containter = UIView()
  let ingredientsStack = UIStackView()
  
  let dividerView = Divider()
  let dividerViewSequel = Divider()
  
//  MARK: - Labels
  let cardNumberLabel = UILabel()
  var ingredientLabel = UILabel()
  let directionsLabel = SCLabel()
  
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
    self.cardNumberLabel.text = "\(recipeName.capitalized)\nStage \(cardCounter)"
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
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = K.primary
    
    cardView.translatesAutoresizingMaskIntoConstraints = false
    containter.translatesAutoresizingMaskIntoConstraints = false
    
    cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    cardNumberLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    cardNumberLabel.textColor = K.invertPrimary
    cardNumberLabel.numberOfLines = 0
    cardNumberLabel.textAlignment = .center
    
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    
    ingredientsStack.translatesAutoresizingMaskIntoConstraints = false
    ingredientsStack.axis = .vertical
    ingredientsStack.distribution = .fillProportionally
    ingredientsStack.spacing = 8
    
    dividerViewSequel.translatesAutoresizingMaskIntoConstraints = false
    
    directionsLabel.translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  func layout() {
    view.addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
    
    
    scrollView.addSubview(cardView)
    NSLayoutConstraint.activate([
      cardView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
      cardView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    
    cardView.addSubview(containter)
    NSLayoutConstraint.activate([
      containter.topAnchor.constraint(equalTo: cardView.topAnchor),
      containter.leadingAnchor.constraint(equalToSystemSpacingAfter: cardView.leadingAnchor, multiplier: 2),
      cardView.trailingAnchor.constraint(equalToSystemSpacingAfter: containter.trailingAnchor, multiplier: 2),
      containter.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
    ])
    
    // top label
    containter.addSubview(cardNumberLabel)
    NSLayoutConstraint.activate([
      cardNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: containter.topAnchor, multiplier: 1),
      cardNumberLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: cardNumberLabel.trailingAnchor, multiplier: 4)
    ])
    
    // first divider
    containter.addSubview(dividerView)
    NSLayoutConstraint.activate([
      dividerView.topAnchor.constraint(equalToSystemSpacingBelow: cardNumberLabel.bottomAnchor, multiplier: 1),
      dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 4)
    ])
    
    // ingredients
    containter.addSubview(ingredientsStack)
    NSLayoutConstraint.activate([
      ingredientsStack.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2),
      ingredientsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientsStack.trailingAnchor, multiplier: 4),
    ])

    if ingredients.isEmpty {
//      directionsLabel.font = .systemFont(ofSize: 24, weight: .semibold)
//      directionsLabel.textAlignment = .center
//      dividerViewSequel.isHidden = true
      let ingredientLine = LargeLabel()
      ingredientsStack.addArrangedSubview(ingredientLine)
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.text = "No Ingredients Used"
    } else {
      for i in 0 ..< ingredients.count {
        let ingredientLine = LargeLabel()
        ingredientsStack.addArrangedSubview(ingredientLine)
        ingredientLine.translatesAutoresizingMaskIntoConstraints = false
        ingredientLine.text = ingredients[i].capitalized
      }
    }
    // second divider
    containter.addSubview(dividerViewSequel)
    NSLayoutConstraint.activate([
      dividerViewSequel.topAnchor.constraint(equalToSystemSpacingBelow: ingredientsStack.bottomAnchor, multiplier: 2),
      dividerViewSequel.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: dividerViewSequel.trailingAnchor, multiplier: 4)
    ])
    
    //directions
    containter.addSubview(directionsLabel)
    NSLayoutConstraint.activate([
      directionsLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerViewSequel.bottomAnchor, multiplier: 2),
      directionsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: directionsLabel.trailingAnchor, multiplier: 4),
    ])

  }
}

