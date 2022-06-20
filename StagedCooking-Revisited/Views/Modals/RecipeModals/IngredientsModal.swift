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
  var ingredients = [String]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  convenience init(ingredients: [String]) {
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
    for i in 0 ..< ingredients.count {
      let ingredientLine = LargeLabel()
      let divder = Divider()
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.text = ingredients[i].capitalized
      detailsStack.addArrangedSubview(ingredientLine)
      detailsStack.addArrangedSubview(divder)
    }
  }
}
