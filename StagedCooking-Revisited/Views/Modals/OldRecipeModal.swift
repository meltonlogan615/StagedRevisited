//
//  RecipeModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

import Foundation
import UIKit

class OldRecipeModal: UIView {
  
  // MARK: - ScrollView Basics
  var scrollView = UIScrollView()
  var contentView = UIView()
  var detailsStack = UIStackView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor(named: "SC-Primary")
  } 
    
// MARK: - Ingredient Properties
  var ingredientsLabel = UILabel()
  var ingredients = [String]() // holder for info that will populate below
  
  convenience init(ingredients: [String]) {
    self.init()
    self.ingredients = ingredients
    style()
    layout()
  }
  
// MARK: - Summary Properties
  var summaryLabel = UILabel()
  var summary = String()
  
  convenience init(summary: String) {
    self.init()
    self.summary = summary
    style()
    layout()
  }
  
// MARK: - Recipe Details Properties
  //  Details - General
  var dishTypeLabel = UILabel()
  var cuisinesLabel = UILabel()
  var servingsLable = UILabel()
  var readyInMinutesLabel = UILabel()
  var veryPopularLabel = UILabel()
  var sustainableLabel = UILabel()
  var cheapLabel = UILabel()
  var pricePerServingLabel = UILabel()
  
  //  Details - Health
  var veryHealthLabel = UILabel()
  var healthScoreLabel = UILabel()
  var weightwatchersLabel = UILabel()
  
  // Details-04 - Restrictions
  var allergensLabel = UILabel()
  var dietsLabel = UILabel()
  var whole30Label = UILabel()
  var vegenLabel = UILabel()
  var vegetarianLabel = UILabel()
  var dairyFreeLabel = UILabel()
  var glutenFreeLabel = UILabel()
  var ketogenicLabel = UILabel()
  var lowFodmapLabel = UILabel()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension OldRecipeModal {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    detailsStack.translatesAutoresizingMaskIntoConstraints = false
    detailsStack.axis = .vertical
    detailsStack.spacing = 8
    
    ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
    
    summaryLabel.translatesAutoresizingMaskIntoConstraints = false
    summaryLabel.numberOfLines = 0
    
    
    cuisinesLabel.translatesAutoresizingMaskIntoConstraints = false
    
    servingsLable.translatesAutoresizingMaskIntoConstraints = false
    
    readyInMinutesLabel.translatesAutoresizingMaskIntoConstraints = false
    
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

    contentView.addSubview(detailsStack)
    NSLayoutConstraint.activate([
      detailsStack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: detailsStack.trailingAnchor, multiplier: 2),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: detailsStack.bottomAnchor, multiplier: 2),
      detailsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
    ])
    
//    generateIngredientLabels()
    
    detailsStack.addArrangedSubview(summaryLabel)
    
   
  }
}

extension OldRecipeModal {
  func generateIngredientLabelsPlease() {
    for i in 0 ..< ingredients.count {
      let ingredientLine = UILabel()
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.numberOfLines = 0
      ingredientLine.text = ingredients[i].capitalized
      ingredientLine.font = .systemFont(ofSize: 20)
      detailsStack.addArrangedSubview(ingredientLine)
    }
  }
}

extension OldRecipeModal {
  func generateDetails() {
    detailsStack.addArrangedSubview(servingsLable)
  }
}
