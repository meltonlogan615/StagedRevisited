//
//  GenerateGeneralInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

// MARK: - NO LONGER IN USE. ALL OF THIS IS NOW IN THE RecipeViewController
/*
 Once tested and verified, this file can be removed.
 */
import Foundation

extension RecipeViewController {
  func generateGeneralInfo(for selectedRecipe: Recipe) -> GeneralInfo {
    let totalTimeString: String = {
      var string = String()
      if let totalTime = selectedRecipe.readyInMinutes {
        string = "Ready to eat in \(totalTime) minutes"
      } else {
        string = "Nah, son."
      }
      return string
    }()
    
    let servingsString: String = {
      var string = String()
      if let servings = selectedRecipe.servings {
        if servings == 1 {
          string = "Makes \(servings) serving"
        } else {
          string = "Makes \(servings) servings"
        }
      }
      return string
    }()
    
    let dishTypeString: String = {
      var string = String()
      if let dishType = selectedRecipe.dishTypes {
        for i in 0 ..< dishType.count {
          if dishType.count == 1 {
            string += dishType[i].capitalized
          } else if dishType[i] == dishType.last {
            string += "and \(dishType[i].capitalized)"
          } else {
            string += "\(dishType[i].capitalized), "
          }
        }
      }
      return string
    }()
    
    let cuisinesString: String = {
      var string = String()
      if let cuisines = selectedRecipe.cuisines {
        if cuisines.count < 0 {
          for i in 0 ..< cuisines.count {
            if cuisines[i] == cuisines.last {
              string += cuisines[i]
            } else {
              string += "\(cuisines[i]), "
            }
          }
        }
      }
      return string
    }()
    
    let popularString: String = {
      var string = String()
      if let popular = selectedRecipe.veryPopular {
        string = (popular ?  "Very Popular" : "Not too popular")
      }
      return string
    }()
    
    let sustainableString: String = {
      var string = String()
      if let sustainable = selectedRecipe.sustainable {
        string = (sustainable ?  "Sustainable Recipe" : "Not Made from Sustainable Ingredients")
      }
      return string
    }()
    
    let info = GeneralInfo(
      readyInMnutes: totalTimeString,
      servings: servingsString,
      dishType: dishTypeString,
      cuisines: cuisinesString,
      veryPopular: popularString,
      sustainable: sustainableString
    )
    
    return info
  }
}
