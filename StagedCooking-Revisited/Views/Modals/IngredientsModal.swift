//
//  IngredientsModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/9/22.
//

import Foundation
import UIKit

/**
 Basic view to display a list of `ingredients`.
 
 `ingredients` property value is received from and assigned via `convenience init` called in `RecipeViewController`
 */
class IngredientsModal: SCModal {
  
  // MARK: - Ingredient Properties
  var ingredients: Ingredients?
  var name = String()
  var amount = Double()
  var unit = String()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  convenience init(ingredients: Ingredients) {
    self.init()
    self.ingredients = ingredients
    generateIngredientLabels()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension IngredientsModal {
  func generateIngredientLabels() {
    guard let allIngredients = ingredients else { return }
    let labelIngredients = allIngredients.ingredients
    for i in 0 ..< labelIngredients.count {
      guard let name = labelIngredients[i].nameClean else { return }
      guard let measure = labelIngredients[i].measures else { return }
      
      guard let us = measure.us else { return }
      guard let usAmount = us.amount else { return }
      guard let usShort = us.unitShort else { return }
      
      guard let metric = measure.metric else { return }
      guard let metricAmount = metric.amount else { return }
      guard let metricShort = metric.unitShort else { return }
      
      let ingredientLine = LargeLabel()
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.text = "\(usAmount) \(usShort.capitalized) (\(metricAmount) \(metricShort)) \(name.capitalized)"
      let divder = Divider()
      detailsStack.addArrangedSubview(ingredientLine)
      detailsStack.addArrangedSubview(divder)
    }
  }
}
