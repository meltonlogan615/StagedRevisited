//
//  IngredientListViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/30/22.
//

import Foundation
import UIKit


class IngredientListViewController: UIViewController {
  
  var ingredientsView = UIView()
  var titleLabel = UILabel()
  let dividerView = Divider()
  var ingredientStack = UIStackView()
  
  var ingredients = [String]()
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
    ingredientsView.layer.borderWidth = 2
    ingredientsView.layer.borderColor = K.scAccent?.cgColor
    ingredientsView.layer.cornerRadius = 8
    ingredientsView.clipsToBounds = true
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
    view.addSubview(ingredientsView)
    NSLayoutConstraint.activate([
      ingredientsView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
      ingredientsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientsView.trailingAnchor, multiplier: 4),
      ingredientsView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4)
    ])

    ingredientsView.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: ingredientsView.topAnchor, multiplier: 1),
      ingredientsView.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: ingredientsView.leadingAnchor, multiplier: 2),
    ])
    
    ingredientsView.addSubview(dividerView)
    NSLayoutConstraint.activate([
      dividerView.heightAnchor.constraint(equalToConstant: 2),
      dividerView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
      ingredientsView.trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 4),
      dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: ingredientsView.leadingAnchor, multiplier: 4)
    ])
    
    for i in 0 ..< ingredients.count {
      let ingredientLine = UILabel()
      ingredientStack.addArrangedSubview(ingredientLine)
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.numberOfLines = 0
      ingredientLine.text = ingredients[i].capitalized
      ingredientLine.font = .systemFont(ofSize: 20)
    }
    
    ingredientsView.addSubview(ingredientStack)
    NSLayoutConstraint.activate([
      ingredientStack.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2),
      ingredientsView.trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientStack.trailingAnchor, multiplier: 2),
      ingredientStack.leadingAnchor.constraint(equalToSystemSpacingAfter: ingredientsView.leadingAnchor, multiplier: 2),
      ingredientStack.centerXAnchor.constraint(equalTo: ingredientsView.centerXAnchor),
    ])
    
  }
}
