//
//  GenerateGeneralInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit

// MARK: - setProperties Method, receives data, unwraps and sends to the view to display
extension RecipeViewController {
  /// Simplifying setting VC properties into a single function rather than creatibng a massive `loadRecipeNew` method of each of the necessary properties.
  func setProperties(for selectedRecipe: Recipe) {
    self.recipe = selectedRecipe
    
    guard let image = selectedRecipe.image else { return }
    self.recipeView.mainImage.loadImage(url: image)
    
    guard let title = selectedRecipe.title else { return }
    self.recipeTitle = title
    
    if let totalTime = selectedRecipe.readyInMinutes {
      self.recipeView.readyInMinutesLabel.icon.image = UIImage(systemName: "clock")
      self.recipeView.readyInMinutesLabel.sign.image = UIImage(systemName: "equal")
      self.recipeView.readyInMinutesLabel.label.text = "\(totalTime) minutes"

    }
    
    if let servings = selectedRecipe.servings {
      self.recipeView.servingsLabel.icon.image = UIImage(systemName: "person")
      self.recipeView.servingsLabel.sign.image = UIImage(systemName: "equal")
      self.recipeView.servingsLabel.label.text = "\(servings)"
    }    
    
    if let dishType = selectedRecipe.dishTypes {
      var dishText = String()
      // Formatting the string to be passed as the label text
      if !dishType.isEmpty {
        for i in 0 ..< dishType.count {
          if dishType.count == 1 {
            dishText = dishType[i].capitalized
          } else if dishType[i] == dishType.last {
            dishText += "or \(dishType[i].capitalized)"
          } else {
            dishText += "\(dishType[i].capitalized), "
          }
        }
        self.recipeView.dishTypeLabel.icon.image = UIImage(systemName: "fork.knife")
        self.recipeView.dishTypeLabel.sign.image = UIImage(systemName: "equal")
        self.recipeView.dishTypeLabel.label.text = dishText
      }
    }
    
    if let cuisines = selectedRecipe.cuisines {
      var string = String()
      // Formatting the string to be passed as the label text
      if cuisines.isEmpty {
        return
      }
      for i in 0 ..< cuisines.count {
        if cuisines[i] == cuisines.last {
          string += cuisines[i]
        } else {
          string += "\(cuisines[i]), "
        }
      }
      self.recipeView.cuisinesLabel.icon.image = UIImage(systemName: "globe")
      self.recipeView.cuisinesLabel.sign.image = UIImage(systemName: "equal")
      self.recipeView.cuisinesLabel.label.text = string
    }
    
    if let popular = selectedRecipe.veryPopular {
      if popular {
        self.recipeView.veryPopularLabel.label.text = "Very Popular"
        self.recipeView.veryPopularLabel.backgroundColor = .blue
      }
      // if not, do not include
    }
    
    if let sustainable = selectedRecipe.sustainable {
      if sustainable {
        self.recipeView.sustainableLabel.icon.image = UIImage(systemName: "leaf")
        self.recipeView.sustainableLabel.sign.image = UIImage(systemName: "equal")
        self.recipeView.sustainableLabel.label.text = "Sustainable Recipe"
        self.recipeView.sustainableLabel.tintColor = .green
      }
      // if not, do not include
    }
    
    ///  Additional methods that were extracted out further to reduce code-bload inside the VC. Used to generate data for the `modalViews`.
    generateIngredientsList(for: selectedRecipe)
    generateSummary(for: selectedRecipe)
    generateMacrosModel(for: selectedRecipe)
    generateDietsInfo(for: selectedRecipe)
  }
}
