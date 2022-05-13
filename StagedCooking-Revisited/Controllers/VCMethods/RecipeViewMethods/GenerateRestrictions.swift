//
//  GenerateDietsInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation

extension NewRecipeViewController {
  func generateDietsInfo(for selectedRecipe: Recipe) {
    
    guard let veryHealthy = selectedRecipe.veryHealthy else { return }
    let healthString: String = {
      var string = String()
      string = (veryHealthy ? "Very Healthy" : "Who's to say what's healthy and what isn't?" )
      return string
    }()
    
    guard let diets = selectedRecipe.diets else { return }
    let dietsString: String = {
      var string = String()
      for i in 0 ..< diets.count {
        if diets.count == 1 {
          string += diets[i].capitalized
        } else if diets[i] == diets.last {
          string += "and \(diets[i].capitalized)"
        } else {
          string += "\(diets[i].capitalized), "
        }
      }
      return string
    }()
    
    guard let whole30 = selectedRecipe.whole30 else { return }
    let whole30String: String = {
      var string = String()
      string = (whole30 ? "Meets Whole30 Requirements" : "Is Not Part of Whole30 Diet")
      return string
    }()
    
    guard let vegan = selectedRecipe.vegan else { return }
    let veganString: String = {
      var string = String()
      string = (vegan ? "Vegan" : "Contains Animal Products")
      return string
    }()
    
    guard let vegetarian = selectedRecipe.vegetarian else { return }
    let vegetarianString: String = {
      var string = String()
      string = (vegetarian ? "Vegetrain" : "Contains Meat Products")
      return string
    }()
    
    guard let dairyFree = selectedRecipe.dairyFree else { return }
    let dairyFreeString: String = {
      var string = String()
      string = (dairyFree ? "Does Not Contain Dairy" : "Contains Dairy")
      return string
    }()
    
    guard let glutenFree = selectedRecipe.glutenFree else { return }
    let glutenFreeString: String = {
      var string = String()
      string = (glutenFree ? "Gluten Free" : "Contains Gluten")
      return string
    }()
    
    guard let keto = selectedRecipe.ketogenic else { return }
    let ketoString: String = {
      var string = String()
      string = (keto ? "Meets Ketogenic Requirements" : "Is Not Keto Friendly")
      return string
    }()
    
    guard let lowFodmap = selectedRecipe.lowFodmap else { return }
    let lowFodmapString: String = {
      var string = String()
      string = (lowFodmap ? "Meets Low Fodmap Requirements" : "Is Not Low Fodmap")
      return string
    }()
        
    guard let healthScore = selectedRecipe.healthScore else { return }
    let healthScoreString: String = {
      var string = String()
      string = "Health Score: \(healthScore)"
      return string
    }()
    
    guard let wwSmartPoints = selectedRecipe.weightWatcherSmartPoints else { return }
    let wwSmartPointsString: String = {
      var string = String()
      string = "WeightWatchers Smart Points: \(wwSmartPoints)"
      return string
    }()
    
    let dietInfo = DietInfo(
      diets: dietsString,
      whole30: whole30String,
      vegan: veganString,
      vegetarian: vegetarianString,
      dairyFree: dairyFreeString,
      glutenFree: glutenFreeString,
      keto: ketoString,
      lowFodmap: lowFodmapString,
      veryHealthy: healthString,
      healthScore: healthScoreString,
      wwSmartPoints: wwSmartPointsString
    )
    self.dietInfo = dietInfo
  }
}
