//
//  RecipeView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

import Foundation
import UIKit

class RecipeView: UIView {
  
  var stackView = UIStackView()
  var mainImage = UIImageView()
  var titleLabel = UILabel()
  
  var showGeneralButton = ActionButton()
  var showIngredientsButton = ActionButton()
  var showSummaryButton = ActionButton()
  var showNutritionButton = ActionButton()
  var showRestrictionsButton = ActionButton()
      
  // Holders for Modal Property Values
  var summary = String()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Styling and Layout
extension RecipeView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 12
    
    mainImage.translatesAutoresizingMaskIntoConstraints = false
    mainImage.contentMode = .scaleAspectFit
    mainImage.layer.cornerRadius = 12
    mainImage.clipsToBounds = true

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    titleLabel.numberOfLines = 0
    titleLabel.textAlignment = .center
    
    showGeneralButton.translatesAutoresizingMaskIntoConstraints = false
    showGeneralButton.setTitle("General", for: [])
    showGeneralButton.setImage(UIImage(systemName: "info.circle"), for: [])

    showIngredientsButton.translatesAutoresizingMaskIntoConstraints = false
    showIngredientsButton.setTitle("Ingredients", for: [])
    showIngredientsButton.setImage(UIImage(systemName: "list.bullet"), for: [])
    
    showSummaryButton.translatesAutoresizingMaskIntoConstraints = false
    showSummaryButton.setTitle("Summary", for: [])
    showSummaryButton.setImage(UIImage(systemName: "doc.text"), for: [])

    showNutritionButton.translatesAutoresizingMaskIntoConstraints = false
    showNutritionButton.setTitle("Nutrition", for: [])
    showNutritionButton.setImage(UIImage(systemName: "heart.circle"), for: [])
    
    showRestrictionsButton.translatesAutoresizingMaskIntoConstraints = false
    showRestrictionsButton.setTitle("Diets", for: [])
    showRestrictionsButton.setImage(UIImage(systemName: "exclamationmark.octagon"), for: [])

    
  }
  
  func layout() {
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
    
    stackView.addArrangedSubview(mainImage)
    NSLayoutConstraint.activate([
      mainImage.heightAnchor.constraint(equalToConstant: 150),
    ])
    
    
    stackView.addArrangedSubview(titleLabel)
    titleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    
    stackView.addArrangedSubview(showGeneralButton)
    NSLayoutConstraint.activate([
      showGeneralButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      showGeneralButton.heightAnchor.constraint(equalToConstant: 48)
    ])

    stackView.addArrangedSubview(showIngredientsButton)
    NSLayoutConstraint.activate([
      showIngredientsButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      showIngredientsButton.heightAnchor.constraint(equalToConstant: 48)
    ])

    stackView.addArrangedSubview(showSummaryButton)
    NSLayoutConstraint.activate([
      showSummaryButton.widthAnchor.constraint(equalTo: showIngredientsButton.widthAnchor),
      showSummaryButton.heightAnchor.constraint(equalTo: showIngredientsButton.heightAnchor)
    ])
    
    stackView.addArrangedSubview(showNutritionButton)
    NSLayoutConstraint.activate([
      showNutritionButton.widthAnchor.constraint(equalTo: showIngredientsButton.widthAnchor),
      showNutritionButton.heightAnchor.constraint(equalTo: showIngredientsButton.heightAnchor)
    ])
    
    stackView.addArrangedSubview(showRestrictionsButton)
    NSLayoutConstraint.activate([
      showRestrictionsButton.widthAnchor.constraint(equalTo: showIngredientsButton.widthAnchor),
      showRestrictionsButton.heightAnchor.constraint(equalTo: showIngredientsButton.heightAnchor)
    ])
  }
}



