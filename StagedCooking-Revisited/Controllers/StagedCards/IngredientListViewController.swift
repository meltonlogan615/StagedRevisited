//
//  IngredientListViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/30/22.
//

import Foundation
import UIKit

/**
 Second View after Start Cooking Button has been tapped.

 Displays a list of all ingredients and their measures when available.
 */
class IngredientListViewController: UIViewController {
  
  var ingredientsView = UIView()
  var titleLabel = UILabel()
  let dividerView = Divider()
  var ingredientStack = UIStackView()
  
  var ingredients: Ingredients?
  
  var recipeName = String()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    
    style()
    layout()
  }
}

extension IngredientListViewController {
  
  func style() {
    ingredientsView.translatesAutoresizingMaskIntoConstraints = false
    ingredientsView.backgroundColor = K.primary

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textColor = K.invertPrimary
    titleLabel.textAlignment = .center
    titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    titleLabel.text = "For \(recipeName), you will need..."
    titleLabel.numberOfLines = 0
    
    dividerView.translatesAutoresizingMaskIntoConstraints = false

    ingredientStack.translatesAutoresizingMaskIntoConstraints = false
    ingredientStack.axis = .vertical
    ingredientStack.distribution = .fillProportionally
    ingredientStack.spacing = 8
  }
  
  func layout() {
    view.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 4),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
    ])
    view.addSubview(dividerView)
    NSLayoutConstraint.activate([
      dividerView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 4),
      dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4)
    ])
    
    view.addSubview(ingredientsView)
    NSLayoutConstraint.activate([
      ingredientsView.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2),
      ingredientsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      ingredientsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])

    
    guard let ingredients = ingredients?.ingredients else { return }
    for i in 0 ..< ingredients.count {
      let ingredientLine = UILabel()
      ingredientStack.addArrangedSubview(ingredientLine)
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.numberOfLines = 0
      ingredientLine.text = ingredients[i].nameClean?.capitalized
      ingredientLine.font = .systemFont(ofSize: 20)
    }
    
    ingredientsView.addSubview(ingredientStack)
    NSLayoutConstraint.activate([
//      ingredientStack.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
      ingredientsView.trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientStack.trailingAnchor, multiplier: 4),
      ingredientStack.leadingAnchor.constraint(equalToSystemSpacingAfter: ingredientsView.leadingAnchor, multiplier: 4),
    ])
    
  }
}
