//
//  GenerateGeneralInfo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation

extension NewRecipeViewController {
  func generateGeneralInfo(for selectedRecipe: Recipe) {
    guard let totalTime = selectedRecipe.readyInMinutes else { return }
    guard let servings = selectedRecipe.servings else { return }
    guard let dishType = selectedRecipe.dishTypes else { return }
    guard let cuisines = selectedRecipe.cuisines else { return }
    guard let popular = selectedRecipe.veryPopular else { return }
    guard let sustainable = selectedRecipe.sustainable else { return }
    
    let totalTimeString: String = {
      var string = String()
      string = "Ready to eat in \(totalTime) minutes"
      return string
    }()
    
    let servingsString: String = {
      var string = String()
      string = "Makes \(servings) servings"
      return string
    }()
    
    let dishTypeString: String = {
      var string = String()
      for i in 0 ..< dishType.count {
        if dishType.count == 1 {
          string += dishType[i].capitalized
        } else if dishType[i] == dishType.last {
          string += "and \(dishType[i].capitalized)"
        } else {
          string += "\(dishType[i].capitalized), "
        }
      }
      return string
    }()
    
    let cuisinesString: String = {
      var string = String()
      for i in 0 ..< cuisines.count {
        if cuisines[i] == cuisines.last {
          string += cuisines[i]
        } else {
          string += "\(cuisines[i]), "
        }
      }
      return string
    }()
    
    let popularString: String = {
      var string = String()
      string = (popular ?  "Very Popular" : "Not too popular")
      return string
    }()
    
    let sustainableString: String = {
      var string = String()
      string = (sustainable ?  "Sustainable Recipe" : "Not Made from Sustainable Ingredients")

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
    
    self.generalInfo = info
  }
}
