//
//  RecipeView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

import Foundation
import UIKit


class RecipeView: UIView {

  var scrollView = UIScrollView()
  var contentView = UIView()
  var stackView = UIStackView()

  var mainImage = UIImageView()
  var titleLabel = UILabel()
  var dividerA = Divider()
  var infoStack = UIStackView()
  var dividerB = Divider()
  
  var showIngredientsButton = DetailsButton()
  var showSummaryButton = DetailsButton()
  var showNutritionButton = DetailsButton()
  var showRestrictionsButton = DetailsButton()
  
  var generalInfo: GeneralInfo?
  
  var readyInMinutesLabel = ModalLabel()
  var servingsLabel = ModalLabel()
  
  var dishTypeLabel = ModalLabel()
  var cuisinesLabel = ModalLabel()
  
  var veryPopularLabel = ModalLabel()
  var sustainableLabel = ModalLabel()
  
  var cheapLabel = ModalLabel()
  var pricePerServingLabel = ModalLabel()
  
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
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 12
    
    mainImage.translatesAutoresizingMaskIntoConstraints = false
    mainImage.contentMode = .center
    mainImage.layer.cornerRadius = 8
    mainImage.clipsToBounds = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    titleLabel.numberOfLines = 0
    titleLabel.textAlignment = .center

    dividerA.translatesAutoresizingMaskIntoConstraints = false
    
    infoStack.translatesAutoresizingMaskIntoConstraints = false
    infoStack.axis = .vertical
    
    dividerB.translatesAutoresizingMaskIntoConstraints = false
    
    readyInMinutesLabel.translatesAutoresizingMaskIntoConstraints = false
    servingsLabel.translatesAutoresizingMaskIntoConstraints = false
    dishTypeLabel.translatesAutoresizingMaskIntoConstraints = false
    cuisinesLabel.translatesAutoresizingMaskIntoConstraints = false
    veryPopularLabel.translatesAutoresizingMaskIntoConstraints = false
    sustainableLabel.translatesAutoresizingMaskIntoConstraints = false
    cheapLabel.translatesAutoresizingMaskIntoConstraints = false
    pricePerServingLabel.translatesAutoresizingMaskIntoConstraints = false
    
    //    showGeneralButton.translatesAutoresizingMaskIntoConstraints = false
    //    showGeneralButton.setTitle("General", for: [])
    //    showGeneralButton.setImage(UIImage(systemName: "info.circle"), for: [])
    
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
    addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
    ])
    
    scrollView.addSubview(contentView)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])

    contentView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
      contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
    ])

    
    stackView.addArrangedSubview(mainImage)
    NSLayoutConstraint.activate([
      mainImage.heightAnchor.constraint(equalToConstant: 168),
    ])
    
    stackView.addArrangedSubview(titleLabel)
    titleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    
    stackView.addArrangedSubview(dividerA)
    
    stackView.addArrangedSubview(infoStack)
    NSLayoutConstraint.activate([
      infoStack.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 2),
      stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: infoStack.trailingAnchor, multiplier: 2)
    ])
    infoStack.addArrangedSubview(readyInMinutesLabel)
    infoStack.addArrangedSubview(servingsLabel)
    infoStack.addArrangedSubview(dishTypeLabel)
    infoStack.addArrangedSubview(cuisinesLabel)
    infoStack.addArrangedSubview(veryPopularLabel)
    infoStack.addArrangedSubview(sustainableLabel)
    infoStack.addArrangedSubview(cheapLabel)
    infoStack.addArrangedSubview(pricePerServingLabel)
    
    stackView.addArrangedSubview(dividerB)
    
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



