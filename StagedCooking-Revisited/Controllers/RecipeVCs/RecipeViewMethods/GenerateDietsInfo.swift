//
//  GenerateDietsInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/8/22.
//

// extract in to solo class and return the data into the ReceipeViewController
// John Sundell youtube.

import Foundation
//
//extension RecipeViewController {
//  func generateDietsInfo(for selectedRecipe: Recipe) {
//    var veryHealthySafe = String()
//    var dietsSafe = String()
//    var whole30Safe = String()
//    var veganSafe = String()
//    var vegetarianSafe = String()
//    var dairyFreeSafe = String()
//    var glutenFreeSafe = String()
//    var ketoSafe = String()
//    var lowFodmapSafe = String()
//    var healthScoreSafe = String()
//    var wwSmartPointsSafe = String()
//
//    if let veryHealthy = selectedRecipe.veryHealthy {
//      let healthString: String = {
//        var string = String()
//        string = (veryHealthy ? "Very Healthy" : "Who's to say what's healthy and what isn't?" )
//        return string
//      }()
//      veryHealthySafe = healthString
//    }
//
//    if let diets = selectedRecipe.diets {
//      let dietsString: String = {
//        var string = String()
//        for i in 0 ..< diets.count {
//          if diets.count == 1 {
//            string += diets[i].rawValue.capitalized
//          } else if diets[i] == diets.last {
//            string += "and \(diets[i].rawValue.capitalized)"
//          } else {
//            string += "\(diets[i].rawValue.capitalized), "
//          }
//        }
//        return string
//      }()
//      dietsSafe = dietsString
//    }
//
//    if let whole30 = selectedRecipe.whole30 {
//      let whole30String: String = {
//        var string = String()
//        string = (whole30 ? "Meets Whole30 Requirements" : "Is Not Part of Whole30 Diet")
//        return string
//      }()
//      whole30Safe = whole30String
//    }
//
//    if let vegan = selectedRecipe.vegan {
//      let veganString: String = {
//        var string = String()
//        string = (vegan ? "Vegan" : "Contains Animal Products")
//        return string
//      }()
//      veganSafe = veganString
//    }
//
//    if let vegetarian = selectedRecipe.vegetarian {
//      let vegetarianString: String = {
//        var string = String()
//        string = (vegetarian ? "Vegetrain" : "Contains Meat Products")
//        return string
//      }()
//      vegetarianSafe = vegetarianString
//    }
//
//    if let dairyFree = selectedRecipe.dairyFree {
//      let dairyFreeString: String = {
//        var string = String()
//        string = (dairyFree ? "Does Not Contain Dairy" : "Contains Dairy")
//        return string
//      }()
//      dairyFreeSafe = dairyFreeString
//    }
//
//    if let glutenFree = selectedRecipe.glutenFree {
//      let glutenFreeString: String = {
//        var string = String()
//        string = (glutenFree ? "Gluten Free" : "Contains Gluten")
//        return string
//      }()
//      glutenFreeSafe = glutenFreeString
//    }
//
//    if let keto = selectedRecipe.ketogenic {
//      let ketoString: String = {
//        var string = String()
//        string = (keto ? "Meets Ketogenic Requirements" : "Is Not Keto Friendly")
//        return string
//      }()
//      ketoSafe = ketoString
//    }
//
//    if let lowFodmap = selectedRecipe.lowFodmap {
//      let lowFodmapString: String = {
//        var string = String()
//        string = (lowFodmap ? "Meets Low Fodmap Requirements" : "Is Not Low Fodmap")
//        return string
//      }()
//      lowFodmapSafe = lowFodmapString
//    }
//
//    if let healthScore = selectedRecipe.healthScore {
//      let healthScoreString: String = {
//        var string = String()
//        string = "Health Score: \(healthScore)"
//        return string
//      }()
//      healthScoreSafe = healthScoreString
//    }
//
//    if let wwSmartPoints = selectedRecipe.weightWatcherSmartPoints {
//      let wwSmartPointsString: String = {
//        var string = String()
//        string = "WeightWatchers Smart Points: \(wwSmartPoints)"
//        return string
//      }()
//      wwSmartPointsSafe = wwSmartPointsString
//    }
//
//    let dietInfo = DietInfo(
//      diets: dietsSafe,
//      whole30: whole30Safe,
//      vegan: veganSafe,
//      vegetarian: vegetarianSafe,
//      dairyFree: dairyFreeSafe,
//      glutenFree: glutenFreeSafe,
//      keto: ketoSafe,
//      lowFodmap: lowFodmapSafe,
//      veryHealthy: veryHealthySafe,
//      healthScore: healthScoreSafe,
//      wwSmartPoints: wwSmartPointsSafe
//    )
//    self.dietInfo = dietInfo
//  }
//}

//class DietInfoGenerated: Codable {
//  var dairyFree: String?
//  var diets: String?
//  var glutenFree: String?
//  var healthScore: String?
//  var keto: String?
//  var lowFodmap: String?
//  var vegan: String?
//  var vegetarian: String?
//  var veryHealthy: String?
//  var whole30: String?
//  var wwSmartPoints: String?
//
////  init(dairyFree: String?, diets: String?, glutenFree: String?, healthScore: String?, keto: String?, lowFodmap: String?, vegan: String?, vegetarian: String?, veryHealthy: String?, whole30: String?, wwSmartPoints: String?) {
////    self.dairyFree = dairyFree
////    self.diets = diets
////    self.glutenFree = glutenFree
////    self.healthScore = healthScore
////    self.keto = keto
////    self.lowFodmap = lowFodmap
////    self.vegan = vegan
////    self.vegetarian = vegetarian
////    self.veryHealthy = veryHealthy
////    self.whole30 = whole30
////    self.wwSmartPoints = wwSmartPoints
////  }
//
////  init(using recipe: Recipe) {
////    self.dairyFree = recipe.dairyFree
////    self.diets = recipe.diets
////    self.glutenFree = recipe.glutenFree
////  }
//
//  func generateInfo(for selectedRecipe: Recipe) -> DietInfo {
//    var dairyFreeSafe = String()
//    if let dairyFree = selectedRecipe.dairyFree {
//      let dairyFreeString: String = {
//        var string = String()
//        string = (dairyFree ? "Does Not Contain Dairy" : "Contains Dairy")
//        return string
//      }()
//      dairyFreeSafe = dairyFreeString
//    }
//
//    var dietsSafe = String()
//    if let diets = selectedRecipe.diets {
//      let dietsString: String = {
//        var string = String()
//        for i in 0 ..< diets.count {
//          if diets.count == 1 {
//            string += diets[i].rawValue.capitalized
//          } else if diets[i] == diets.last {
//            string += "and \(diets[i].rawValue.capitalized)"
//          } else {
//            string += "\(diets[i].rawValue.capitalized), "
//          }
//        }
//        return string
//      }()
//      dietsSafe = dietsString
//    }
//
//    var glutenFreeSafe = String()
//    if let glutenFree = selectedRecipe.glutenFree {
//      let glutenFreeString: String = {
//        var string = String()
//        string = (glutenFree ? "Gluten Free" : "Contains Gluten")
//        return string
//      }()
//      glutenFreeSafe = glutenFreeString
//    }
//
//    var healthScoreSafe = String()
//    if let healthScore = selectedRecipe.healthScore {
//      let healthScoreString: String = {
//        var string = String()
//        string = "Health Score: \(healthScore)"
//        return string
//      }()
//      healthScoreSafe = healthScoreString
//    }
//
//    var ketoSafe = String()
//    if let keto = selectedRecipe.ketogenic {
//      let ketoString: String = {
//        var string = String()
//        string = (keto ? "Meets Ketogenic Requirements" : "Is Not Keto Friendly")
//        return string
//      }()
//      ketoSafe = ketoString
//    }
//
//    var lowFodmapSafe = String()
//    if let lowFodmap = selectedRecipe.lowFodmap {
//      let lowFodmapString: String = {
//        var string = String()
//        string = (lowFodmap ? "Meets Low Fodmap Requirements" : "Is Not Low Fodmap")
//        return string
//      }()
//      lowFodmapSafe = lowFodmapString
//    }
//
//    var veganSafe = String()
//    if let vegan = selectedRecipe.vegan {
//      let veganString: String = {
//        var string = String()
//        string = (vegan ? "Vegan" : "Contains Animal Products")
//        return string
//      }()
//      veganSafe = veganString
//    }
//
//    var vegetarianSafe = String()
//    if let vegg = selectedRecipe.vegetarian {
//      let vegetarianString: String = {
//        var string = String()
//        string = (vegg ? "Vegetrain" : "Contains Meat Products")
//        return string
//      }()
//      vegetarianSafe = vegetarianString
//    }
//
//    var veryHealthySafe = String()
//    if let veryHealthy = selectedRecipe.veryHealthy {
//      let veryHealthyString: String = {
//        var string = String()
//        string = (veryHealthy ? "Very Healthy" : "Who's to say what's healthy and what isn't?" )
//        return string
//      }()
//      veryHealthySafe = veryHealthyString
//    }
//
//    var wholeThirtySafe = String()
//    if let whole30 = selectedRecipe.whole30 {
//      let whole30String: String = {
//        var string = String()
//        string = (whole30 ? "Meets Whole30 Requirements" : "Is Not Part of Whole30 Diet")
//        return string
//      }()
//      wholeThirtySafe = whole30String
//    }
//    var smartPointsSafe = String()
//    if let wwSmartPoints = selectedRecipe.weightWatcherSmartPoints {
//      let wwSmartPointsString: String = {
//        var string = String()
//        string = "WeightWatchers Smart Points: \(wwSmartPoints)"
//        return string
//      }()
//      smartPointsSafe = wwSmartPointsString
//    }
//    return DietInfo(dairyFree: dairyFreeSafe, diets: dietsSafe, glutenFree: glutenFreeSafe, healthScore: healthScoreSafe, keto: ketoSafe, lowFodmap: lowFodmapSafe, vegan: veganSafe, vegetarian: vegetarianSafe, veryHealthy: veryHealthySafe, whole30: wholeThirtySafe, wwSmartPoints: smartPointsSafe)
//  }
//}
