//
//  AdvancedMacros.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

// MARK: - FILTER BY NUTRIENTS, can be appended onto any search endpoint
// regular endpoint example: https://api.spoonacular.com/recipes/complexSearch?query=pasta&maxFat=25

// MARK: - Can Also Be Used to Find By Nutrients as shown below
// findByNutrients endpoint example: https://api.spoonacular.com/recipes/findByNutrients?minCarbs=10&maxCarbs=50&number=2

import Foundation

enum AdvancedMacros {
//  case maxReadyTime(amount: Int) // not included in the findByNutrients mentioned above
  
  case minCarbs(amount: Int)
  case maxCarb(amount: Int)
  
  case minProtein(amount: Int)
  case maxProtein(amount: Int)
  
  case minCalories(amount: Int)
  case maxCalories(amount: Int)
  
  case minFat(amount: Int)
  case maxFat(amount: Int)
  
  case minAlcohol(amount: Int)
  case maxAlcohol(amount: Int)
  
  case minCaffeine(amount: Int)
  case maxCaffeine(amount: Int)
  
  case minCopper(amount: Int)
  case maxCopper(amount: Int)
  
  case minCalcium(amount: Int)
  case maxCalcium(amount: Int)
  
  case minCholine(amount: Int)
  case maxCholine(amount: Int)
  
  case minCholesterol(amount: Int)
  case maxCholesterol(amount: Int)
  
  case minFluoride(amount: Int)
  case maxFluoride(amount: Int)
  
  case minSaturatedFat(amount: Int)
  case maxSaturatedFat(amount: Int)
  
  case minVitaminA(amount: Int)
  case maxVitaminA(amount: Int)
  
  case minVitaminC(amount: Int)
  case maxVitaminC(amount: Int)
  
  case minVitaminD(amount: Int)
  case maxVitaminD(amount: Int)
  
  case minVitaminE(amount: Int)
  case maxVitaminE(amount: Int)
  
  case minVitaminK(amount: Int)
  case maxVitaminK(amount: Int)
  
  case minVitaminB1(amount: Int)
  case maxVitaminB1(amount: Int)
  
  case minVitaminB2(amount: Int)
  case maxVitaminB2(amount: Int)
  
  case minVitaminB5(amount: Int)
  case maxVitaminB5(amount: Int)
  
  case minVitaminB3(amount: Int)
  case maxVitaminB3(amount: Int)
  
  case minVitaminB6(amount: Int)
  case maxVitaminB6(amount: Int)
  
  case minVitaminB12(amount: Int)
  case maxVitaminB12(amount: Int)
  
  case minFiber(amount: Int)
  case maxFiber(amount: Int)
  
  case minFolate(amount: Int)
  case maxFolate(amount: Int)
  
  case minFolicAcid(amount: Int)
  case maxFolicAcid(amount: Int)
  
  case minIodine(amount: Int)
  case maxIodine(amount: Int)
  
  case minIron(amount: Int)
  case maxIron(amount: Int)
  
  case minMagnesium(amount: Int)
  case maxMagnesium(amount: Int)
  
  case minManganese(amount: Int)
  case maxManganese(amount: Int)
  
  case minPhosphorus(amount: Int)
  case maxPhosphorus(amount: Int)
  
  case minPotassium(amount: Int)
  case maxPotassium(amount: Int)
  
  case minSelenium(amount: Int)
  case maxSelenium(amount: Int)
  
  case minSodium(amount: Int)
  case maxSodium(amount: Int)
  
  case minSugar(amount: Int)
  case maxSugar(amount: Int)
  
  case minZinc(amount: Int)
  case maxZinc(amount: Int)
}
