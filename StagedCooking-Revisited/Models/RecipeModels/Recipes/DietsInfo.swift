//
//  DietsInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
/**
 Struct for information relating to `Diet` enum.
 
 Data is generated in `RecipeViewController` and it's extension `GenerateDietsInfo`.
 
 Passed into `DietsModal` and used to populate the `.text` properties of the  `SCLabel`.
 */
class DietInfo: Codable {
  var dairyFree = String()
  var diets = String()
  var glutenFree = String()
  var healthScore = String()
  var keto = String()
  var lowFodmap = String()
  var vegan = String()
  var vegetarian = String()
  var veryHealthy = String()
  var whole30 = String()
  var wwSmartPoints = String()
  
  init(from recipe: Recipe) {
    if let dairyFree = recipe.dairyFree {
      let dairyFreeString: String = {
        var string = String()
        string = (dairyFree ? "Does Not Contain Dairy" : "Contains Dairy")
        return string
      }()
      self.dairyFree = dairyFreeString
    }
    
    if let diets = recipe.diets {
      let dietsString: String = {
        var string = String()
        for i in 0 ..< diets.count {
          if diets.count == 1 {
            string += diets[i].rawValue.capitalized
          } else if diets[i] == diets.last {
            string += "and \(diets[i].rawValue.capitalized)"
          } else {
            string += "\(diets[i].rawValue.capitalized), "
          }
        }
        return string
      }()
      self.diets = dietsString
    }
    
    if let glutenFree = recipe.glutenFree {
      let glutenFreeString: String = {
        var string = String()
        string = (glutenFree ? "Gluten Free" : "Contains Gluten")
        return string
      }()
      self.glutenFree = glutenFreeString
    }
    
    if let healthScore = recipe.healthScore {
      let healthScoreString: String = {
        var string = String()
        string = "Health Score: \(healthScore)"
        return string
      }()
      self.healthScore = healthScoreString
    }
    
    if let keto = recipe.ketogenic {
      let ketoString: String = {
        var string = String()
        string = (keto ? "Meets Ketogenic Requirements" : "Is Not Keto Friendly")
        return string
      }()
      self.keto = ketoString
    }
    
    if let lowFodmap = recipe.lowFodmap {
      let lowFodmapString: String = {
        var string = String()
        string = (lowFodmap ? "Meets Low Fodmap Requirements" : "Is Not Low Fodmap")
        return string
      }()
      self.lowFodmap = lowFodmapString
    }
    
    if let vegan = recipe.vegan {
      let veganString: String = {
        var string = String()
        string = (vegan ? "Vegan" : "Contains Animal Products")
        return string
      }()
      self.vegan = veganString
    }
    
    if let vegg = recipe.vegetarian {
      let vegetarianString: String = {
        var string = String()
        string = (vegg ? "Vegetrain" : "Contains Meat Products")
        return string
      }()
      self.vegetarian = vegetarianString
    }
    
    if let veryHealthy = recipe.veryHealthy {
      let veryHealthyString: String = {
        var string = String()
        string = (veryHealthy ? "Very Healthy" : "Who's to say what's healthy and what isn't?" )
        return string
      }()
      self.veryHealthy = veryHealthyString
    }
    
    if let whole30 = recipe.whole30 {
      let whole30String: String = {
        var string = String()
        string = (whole30 ? "Meets Whole30 Requirements" : "Is Not Part of Whole30 Diet")
        return string
      }()
      self.whole30 = whole30String
    }
    
    if let wwSmartPoints = recipe.weightWatcherSmartPoints {
      let wwSmartPointsString: String = {
        var string = String()
        string = "WeightWatchers Smart Points: \(wwSmartPoints)"
        return string
      }()
      self.wwSmartPoints = wwSmartPointsString
    }
    
  }
}
