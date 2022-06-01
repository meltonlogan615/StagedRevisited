//
//  CardCell.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/21/22.
//

import Foundation
import UIKit
/**
 Custom `UICollectionViewCell` to display `Card` data.

 The idea behind this is to use a swipeable UICollectionView with this occupying the whole screen.
 
 - Would Use the snap into place method to as it progressed through.
 - Not currently in use.
 */
class CardCell: UICollectionViewCell {
    
  let cardView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let cardStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 12
//    stack.distribution = .fillEqually
    return stack
  }()
  
  let cardLabel: SCLabel = {
    let label = SCLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    return label
  }()
  
  let divOne: Divider = {
    let div = Divider()
    div.translatesAutoresizingMaskIntoConstraints = false
    return div
  }()
  
  let ingredientStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 8
//    stack.distribution = .fillEqually
    return stack
  }()
  
  let divTwo: Divider = {
    let div = Divider()
    div.translatesAutoresizingMaskIntoConstraints = false
    return div
  }()
  
  // Directions Scroll View
  let directionsContainer: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let directionsScrollView: UIScrollView = {
    let scroll = UIScrollView()
    scroll.translatesAutoresizingMaskIntoConstraints = false
    scroll.bounces = true
    return scroll
  }()
  
  let directionsView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let directions: SCLabel = {
    let label = SCLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //  MARK: = VC Data
  var recipeName = String()
  var cardCounter = Int()
  var ingredients = [String]()
  var instructions = String()

  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    layout()
  }
  
  convenience init(recipeName: String, cardCounter: Int, ingredients: [String], instructions: String) {
    self.init()
    self.cardLabel.text = "Stage \(cardCounter)"
    self.cardCounter = cardCounter
    self.ingredients = ingredients
    self.instructions = instructions
    self.directions.text = "\(instructions)"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CardCell {
  func layout() {
    cardView.layer.borderColor = K.scAccent?.cgColor
    cardView.layer.borderWidth = 2
    cardView.layer.cornerRadius = 8
    cardView.clipsToBounds = true
    
    contentView.addSubview(cardView)
    NSLayoutConstraint.activate([
      cardView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.safeAreaLayoutGuide.topAnchor, multiplier: 8),
      cardView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 6),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: cardView.trailingAnchor, multiplier: 6),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: cardView.bottomAnchor, multiplier: 8),
    ])
    
    contentView.addSubview(cardStack)
    NSLayoutConstraint.activate([
      cardStack.topAnchor.constraint(equalToSystemSpacingBelow: cardView.topAnchor, multiplier: 2),
      cardStack.leadingAnchor.constraint(equalToSystemSpacingAfter: cardView.leadingAnchor, multiplier: 2),
      cardView.trailingAnchor.constraint(equalToSystemSpacingAfter: cardStack.trailingAnchor, multiplier: 2),
      cardView.bottomAnchor.constraint(equalToSystemSpacingBelow: cardStack.bottomAnchor, multiplier: 2),
    ])
    
    cardStack.addArrangedSubview(cardLabel)
    cardStack.addArrangedSubview(divOne)
    cardStack.addArrangedSubview(ingredientStack)
    ingredientStack.backgroundColor = .blue
    cardStack.addArrangedSubview(divTwo)
    
    cardStack.addArrangedSubview(directionsContainer)
    directionsContainer.backgroundColor = .red
    NSLayoutConstraint.activate([
      directionsContainer.leadingAnchor.constraint(equalTo: cardStack.leadingAnchor),
      directionsContainer.trailingAnchor.constraint(equalTo: cardStack.trailingAnchor),
//      directionsContainer.widthAnchor.constraint(equalTo: cardStack.widthAnchor),
    ])
    
    directionsContainer.addSubview(directionsScrollView)
    NSLayoutConstraint.activate([
      directionsScrollView.topAnchor.constraint(equalTo: directionsContainer.topAnchor),
      directionsScrollView.leadingAnchor.constraint(equalTo: directionsContainer.leadingAnchor),
      directionsScrollView.trailingAnchor.constraint(equalTo: directionsContainer.trailingAnchor),
      directionsScrollView.bottomAnchor.constraint(equalTo: directionsContainer.bottomAnchor),
    ])
    
    directionsScrollView.addSubview(directionsView)
    NSLayoutConstraint.activate([
      directionsView.topAnchor.constraint(equalTo: directionsScrollView.topAnchor),
      directionsView.leadingAnchor.constraint(equalTo: directionsScrollView.leadingAnchor),
      directionsView.trailingAnchor.constraint(equalTo: directionsScrollView.trailingAnchor),
      directionsView.bottomAnchor.constraint(equalTo: directionsScrollView.bottomAnchor),
//      directionsView.widthAnchor.constraint(equalTo: directionsScrollView.widthAnchor),
    ])
    
    directionsView.addSubview(directions)
    NSLayoutConstraint.activate([
      directions.topAnchor.constraint(equalTo: directionsView.topAnchor),
      directions.leadingAnchor.constraint(equalTo: directionsView.leadingAnchor),
      directions.trailingAnchor.constraint(equalTo: directionsView.trailingAnchor),
//      directions.widthAnchor.constraint(equalTo: directionsView.widthAnchor),
    ])
    
    
    directionsScrollView.backgroundColor = .systemPink
  }
}
