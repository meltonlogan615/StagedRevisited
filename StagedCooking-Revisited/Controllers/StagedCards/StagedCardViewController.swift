//
//  StagedCardViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/13/22.
//

import Foundation
import UIKit

/*
 This is the bulk of the `StagedCardContainerViewController`.
 
 The Container takes an array of `Card`s and creates as many as are needed for the recipe.
 */
class StagedCardViewController: UIViewController {
  
  // MARK: - Views
  let scrollView = UIScrollView()
  let cardView = UIView()
  let containter = UIView()
  
  //  MARK: - Name and Counter
  var recipeName = String()
  let nameAndStepNumberLabel = UILabel()
  var cardCounter = Int()

  let dividerViewSequel = Divider()
  
  // MARK: - Ingredients
  let ingredientsStack = UIStackView()
  var ingredients: Ingredients?

  let dividerView = Divider()
  
  // MARK: - Directions
  let directionsLabel = SCLabel()
  var directions = String()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    style()
    layout()
  }
  
  /// intializer used inorder to create an array of VCs.
  init(recipeName: String, cardCounter: Int, ingredients: Ingredients, instructions: String) {
    self.nameAndStepNumberLabel.text = "\(recipeName.capitalized)\nStage \(cardCounter)"
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
    cardView.translatesAutoresizingMaskIntoConstraints = false
    containter.translatesAutoresizingMaskIntoConstraints = false
    
    nameAndStepNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    nameAndStepNumberLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    nameAndStepNumberLabel.textColor = K.invertPrimary
    nameAndStepNumberLabel.numberOfLines = 0
    nameAndStepNumberLabel.textAlignment = .center
    
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
    
    // Top label
    containter.addSubview(nameAndStepNumberLabel)
    NSLayoutConstraint.activate([
      nameAndStepNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: containter.topAnchor, multiplier: 1),
      nameAndStepNumberLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: nameAndStepNumberLabel.trailingAnchor, multiplier: 4)
    ])
    
    // First divider
    containter.addSubview(dividerView)
    NSLayoutConstraint.activate([
      dividerView.topAnchor.constraint(equalToSystemSpacingBelow: nameAndStepNumberLabel.bottomAnchor, multiplier: 1),
      dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 4)
    ])
    
    // Ingredients Stack
    containter.addSubview(ingredientsStack)
    NSLayoutConstraint.activate([
      ingredientsStack.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2),
      ingredientsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: containter.leadingAnchor, multiplier: 4),
      containter.trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientsStack.trailingAnchor, multiplier: 4),
    ])

    // Looping through [ingredients] to generate LargeLabels and place them into ingredientsStack
    guard let ingredients = ingredients?.ingredients else { return }
    if ingredients.isEmpty {
      let ingredientLine = LargeLabel()
      ingredientsStack.addArrangedSubview(ingredientLine)
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.text = "No Ingredients Used"
    } else {
      for i in 0 ..< ingredients.count {
        let ingredientLine = LargeLabel()
        ingredientsStack.addArrangedSubview(ingredientLine)
        ingredientLine.translatesAutoresizingMaskIntoConstraints = false
        guard let name = ingredients[i].nameClean?.capitalized else { return }
        guard let measures = ingredients[i].measures else { return }
//        guard let usAmount = measures.us?.amount else { return }
//        guard let usUnit = measures.us?.unitShort else { return }
        guard let metricAmount = measures.metric?.amount else { return }
        guard let metricUnit = measures.metric?.unitShort else { return }
        // TODO: - Later will be switch on settings based on ChefSettings for measurements
//        let usFormat = "\(usAmount) \(usUnit) "
        let metricFormat = "\(metricAmount) \(metricUnit)"
        ingredientLine.text = metricFormat + name
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

