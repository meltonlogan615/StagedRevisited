//
//  GenerateDietsInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation

extension RecipeViewController {
  func generateDietsInfo(for selectedRecipe: Recipe) {
    var veryHealthySafe = String()
    var dietsSafe = String()
    var whole30Safe = String()
    var veganSafe = String()
    var vegetarianSafe = String()
    var dairyFreeSafe = String()
    var glutenFreeSafe = String()
    var ketoSafe = String()
    var lowFodmapSafe = String()
    var healthScoreSafe = String()
    var wwSmartPointsSafe = String()
    
    if let veryHealthy = selectedRecipe.veryHealthy {
      let healthString: String = {
        var string = String()
        string = (veryHealthy ? "Very Healthy" : "Who's to say what's healthy and what isn't?" )
        return string
      }()
      veryHealthySafe = healthString
    }

    if let diets = selectedRecipe.diets {
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
      dietsSafe = dietsString
    }
    
    if let whole30 = selectedRecipe.whole30 {
      let whole30String: String = {
        var string = String()
        string = (whole30 ? "Meets Whole30 Requirements" : "Is Not Part of Whole30 Diet")
        return string
      }()
      whole30Safe = whole30String
    }
    
    if let vegan = selectedRecipe.vegan {
      let veganString: String = {
        var string = String()
        string = (vegan ? "Vegan" : "Contains Animal Products")
        return string
      }()
      veganSafe = veganString
    }
    
    if let vegetarian = selectedRecipe.vegetarian {
      let vegetarianString: String = {
        var string = String()
        string = (vegetarian ? "Vegetrain" : "Contains Meat Products")
        return string
      }()
      vegetarianSafe = vegetarianString
    }
    
    if let dairyFree = selectedRecipe.dairyFree {
      let dairyFreeString: String = {
        var string = String()
        string = (dairyFree ? "Does Not Contain Dairy" : "Contains Dairy")
        return string
      }()
      dairyFreeSafe = dairyFreeString
    }
    
    if let glutenFree = selectedRecipe.glutenFree {
      let glutenFreeString: String = {
        var string = String()
        string = (glutenFree ? "Gluten Free" : "Contains Gluten")
        return string
      }()
      glutenFreeSafe = glutenFreeString
    }
    
    if let keto = selectedRecipe.ketogenic {
      let ketoString: String = {
        var string = String()
        string = (keto ? "Meets Ketogenic Requirements" : "Is Not Keto Friendly")
        return string
      }()
      ketoSafe = ketoString
    }
    
    if let lowFodmap = selectedRecipe.lowFodmap {
      let lowFodmapString: String = {
        var string = String()
        string = (lowFodmap ? "Meets Low Fodmap Requirements" : "Is Not Low Fodmap")
        return string
      }()
      lowFodmapSafe = lowFodmapString
    }
        
    if let healthScore = selectedRecipe.healthScore {
      let healthScoreString: String = {
        var string = String()
        string = "Health Score: \(healthScore)"
        return string
      }()
      healthScoreSafe = healthScoreString
    }
    
    if let wwSmartPoints = selectedRecipe.weightWatcherSmartPoints {
      let wwSmartPointsString: String = {
        var string = String()
        string = "WeightWatchers Smart Points: \(wwSmartPoints)"
        return string
      }()
      wwSmartPointsSafe = wwSmartPointsString
    }
    
    let dietInfo = DietInfo(
      diets: dietsSafe,
      whole30: whole30Safe,
      vegan: veganSafe,
      vegetarian: vegetarianSafe,
      dairyFree: dairyFreeSafe,
      glutenFree: glutenFreeSafe,
      keto: ketoSafe,
      lowFodmap: lowFodmapSafe,
      veryHealthy: veryHealthySafe,
      healthScore: healthScoreSafe,
      wwSmartPoints: wwSmartPointsSafe
    )
    self.dietInfo = dietInfo
  }
}
