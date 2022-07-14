//
//  Restrictions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation

/**
 Struct for information relating to  the `Recipe` itself.
 
 Previously, was used to hold data that would be passedinto the `GeneralModal`, but is no longer in use as that information is populated into the `RecipeView` itself.
 
 - May no longer be needed.
 */

struct GeneralInfo: Codable {
  var cuisines = String()
  var dishType = String()
  var readyInMnutes = String()
  var servings = String()
  var sustainable = String()
  var title = String()
  var veryPopular = String()
  
  init(from recipe: Recipe) {
    if let cuisines = recipe.cuisines {
      var cuisinesText = String()
      if !cuisines.isEmpty {
        cuisinesText = ""
        for i in 0 ..< cuisines.count {
          if cuisines[i] == cuisines.last {
            cuisinesText += cuisines[i]
          } else {
            cuisinesText += "\(cuisines[i]), "
          }
        }
      }
      self.cuisines = cuisinesText
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
      }
      self.dishType = dishText
    }
       
    if let totalTime = recipe.readyInMinutes {
      self.readyInMnutes = "\(totalTime) minutes"
    }

    if let servings = recipe.servings {
      self.servings = "\(servings)"
    }

    if let sustainable = recipe.sustainable {
      var sustainableString = String()
      if sustainable {
        sustainableString = "Sustainable Recipe"
      }
      self.sustainable = sustainableString
    }
    
    if let title = recipe.title {
      self.title = title
    }
    
    if let popular = recipe.veryPopular {
      var popularString = String()
      if popular {
        popularString = "Very Popular"
      }
      self.veryPopular = popularString
    }

  }
}
