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
  func setProperties(for recipe: Recipe) {
    self.recipe = recipe
    
    guard let image = recipe.image else { return }
    self.recipeView.mainImage.loadImage(url: image)
    
    
    if let totalTime = recipe.readyInMinutes {
      self.recipeView.readyInMinutesLabel.icon.image = UIImage(systemName: "clock")
      self.recipeView.readyInMinutesLabel.sign.image = UIImage(systemName: "equal")
      self.recipeView.readyInMinutesLabel.label.text = "\(totalTime) minutes"
    }
    
    if let servings = recipe.servings {
      self.recipeView.servingsLabel.icon.image = UIImage(systemName: "person")
      self.recipeView.servingsLabel.sign.image = UIImage(systemName: "equal")
      self.recipeView.servingsLabel.label.text = "\(servings)"
    }
    
    if let dishType = recipe.dishTypes {
      var dishText = String()
      // Formatting the string to be passed as the label text
      if !dishType.isEmpty {
        for i in 0 ..< dishType.count {
          if dishType.count == 1 {
            dishText = dishType[i].rawValue.localizedCapitalized
          } else if dishType[i] == dishType.last {
            dishText += "or \(dishType[i].rawValue.localizedCapitalized)"
          } else {
            dishText += "\(dishType[i].rawValue.localizedCapitalized), "
          }
        }
        self.recipeView.dishTypeLabel.icon.image = UIImage(systemName: "fork.knife")
        self.recipeView.dishTypeLabel.sign.image = UIImage(systemName: "equal")
        self.recipeView.dishTypeLabel.label.text = dishText
      }
    }
    
    if let cuisines = recipe.cuisines {
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
    
    if let popular = recipe.veryPopular {
      if popular {
        self.recipeView.veryPopularLabel.label.text = "Very Popular"
        self.recipeView.veryPopularLabel.backgroundColor = .blue
      }
      // if not, do not include
    }
    
    if let sustainable = recipe.sustainable {
      if sustainable {
        self.recipeView.sustainableLabel.icon.image = UIImage(systemName: "leaf")
        self.recipeView.sustainableLabel.sign.image = UIImage(systemName: "equal")
        self.recipeView.sustainableLabel.label.text = "Sustainable Recipe"
        self.recipeView.sustainableLabel.tintColor = .green
      }
      // if not, do not include
    }
    
//    if let cheap = recipe.cheap {
//      if cheap {
//        self.recipeView.cheapLabel.label.text = ""
//      }
//    }
    
    if let price = recipe.pricePerServing {
      self.recipeView.pricePerServingLabel.icon.image = UIImage(systemName: "banknote")
      self.recipeView.pricePerServingLabel.sign.image = UIImage(systemName: "equal")
      self.recipeView.pricePerServingLabel.label.text = "\(price / 100) Per Serving"
    }

  }
}
