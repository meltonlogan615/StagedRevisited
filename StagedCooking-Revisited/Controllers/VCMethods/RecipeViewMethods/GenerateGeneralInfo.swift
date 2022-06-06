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
    
    guard let totalTime = selectedRecipe.readyInMinutes else { return }
    self.recipeView.readyInMinutesLabel.text = "⏲ 🟰 \(totalTime) minutes"
    
    guard let servings = selectedRecipe.servings else { return }
    self.recipeView.servingsLabel.text = "👤 🟰 \(servings)"
    
    
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
        self.recipeView.dishTypeLabel.text = "👍 🟰 \(dishText)"
      }
    }
    
    if let cuisines = selectedRecipe.cuisines {
      var string = String()
      // Formatting the string to be passed as the label text
      for i in 0 ..< cuisines.count {
        if cuisines[i] == cuisines.last {
          string += cuisines[i]
        } else {
          string += "\(cuisines[i]), "
        }
      }
      switch cuisines.count {
        case 0:
          break
        case 1:
          self.recipeView.cuisinesLabel.text = "Cuisine: \(string)"
        default:
          self.recipeView.cuisinesLabel.text = "Cuisines: \(string)"
      }
    }
    
    if let popular = selectedRecipe.veryPopular {
      if popular {
        self.recipeView.veryPopularLabel.text = "Very Popular"
      }
      // if not, do not include
    }
    
    if let sustainable = selectedRecipe.sustainable {
      if sustainable {
        self.recipeView.sustainableLabel.text = "🌱 Sustainable Recipe 🌱"
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
