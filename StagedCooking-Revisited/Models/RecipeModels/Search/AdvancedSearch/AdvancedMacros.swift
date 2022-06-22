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

enum AdvancedMacros: String, CaseIterable {
  //  case maxReadyTime(amount: Int) // not included in the findByNutrients mentioned above
  // 36 - done
  case minCarbs = "Min Carbs"
  case maxCarb = "Max Carbs"
  // 35 - done
  case minProtein = "Min Protein"
  case maxProtein = "Max Protein"
  // 34 - done
  case minCalories = "Min Calories"
  case maxCalories = "Max Calories"
  // 33 - done
  case minFat = "Min Fat"
  case maxFat = "Max Fat"
  // 32 - done
  case minAlcohol = "Min Alcohol"
  case maxAlcohol = "Max Alcohol"
  // 31 - done
  case minCaffeine = "Min Caffeine"
  case maxCaffeine = "Max Caffeine"
  // 30 - done
  case minCopper = "Min Copper"
  case maxCopper = "Max Copper"
  // 29 - done
  case minCalcium = "Min Calcium"
  case maxCalcium = "Max Calcium"
  // 28 - done
  case minCholine = "Min Choline"
  case maxCholine = "Max Choline"
  // 27 - done
  case minCholesterol = "Min Cholesterol"
  case maxCholesterol = "Max Cholesterol"
  // 26 - done
  case minFluoride = "Min Fluoride"
  case maxFluoride = "Max Fluoride"
  // 25 - done
  case minSaturatedFat = "Min Saturated Fat"
  case maxSaturatedFat = "Max Saaturated Fat"
  // 24 - done
  case minVitaminA = "Min Vitamin A"
  case maxVitaminA = "Max Vitamin A"
  // 23 - done
  case minVitaminC = "Min Vitamin C"
  case maxVitaminC = "Max Vitamin C"
  // 22 - done
  case minVitaminD = "Min Vitamin D"
  case maxVitaminD = "Max Vitamin D"
  // 21 - done
  case minVitaminE = "Min Vitamin E"
  case maxVitaminE = "Max Vitamin E"
  // 20 - done
  case minVitaminK = "Min Vitamin K"
  case maxVitaminK = "Max Vitamin K"
  // 19 - done
  case minVitaminB1 = "Min Vitamin B1"
  case maxVitaminB1 = "Max Vitamin B1"
  // 18 - done
  case minVitaminB2 = "Min Vitamin B2"
  case maxVitaminB2 = "Max Vitamin B2"
  // 17 - done
  case minVitaminB5 = "Min Vitamin B5"
  case maxVitaminB5 = "Max Vitamin B5"
  // 16 - done
  case minVitaminB3 = "Min Vitamin B3"
  case maxVitaminB3 = "Max Vitamin B3"
  // 15 - done
  case minVitaminB6 = "Min Vitamin B6"
  case maxVitaminB6 = "Max Vitamin B6"
  // 14 - done
  case minVitaminB12 = "Min Vitamin B12"
  case maxVitaminB12 = "Max Vitamin B12"
  // 13 - done
  case minFiber = "Min Fiber"
  case maxFiber = "Max Fiber"
  // 12 - done
  case minFolate = "Min Folate"
  case maxFolate = "Max Folate"
  // 11 - done
  case minFolicAcid = "Min Folic Acid"
  case maxFolicAcid = "Max Folic Acid"
  // 10 - done
  case minIodine = "Min Iodine"
  case maxIodine = "Max Iodine"
  // 9 - done
  case minIron = "Min Iron"
  case maxIron = "Max Iron"
  // 8 - done
  case minMagnesium = "Min Magnesium"
  case maxMagnesium = "Max Magnesium"
  // 7
  case minManganese = "Min Mangenese"
  case maxManganese = "Max Manganese"
  // 6
  case minPhosphorus = "Min Phosphorus"
  case maxPhosphorus = "Max Phsophorus"
  // 5
  case minPotassium = "Min Potassium"
  case maxPotassium = "Max Potassium"
  // 4
  case minSelenium = "Min Selenium"
  case maxSelenium = "Max Selenium"
  // 3
  case minSodium = "Min Sodium"
  case maxSodium = "Max Sodium"
  // 2
  case minSugar = "Min Sugar"
  case maxSugar = "Max Sugar"
  // 1
  case minZinc = "Min Zinc"
  case maxZinc = "Max Zinc"
}

enum MacrosForSpin: String, CaseIterable {
    case SelectMacro = "-- Select Macro --"
case Alcohol, // 32
    Caffeine, // 31
    Carbs, // 36
    Calcium, // 29
    Calories, // 34
    Cholesterol, // 27
    Choline, // 28
    Copper, // 30
    Fat, // 33
    Fiber, // 13
    Fluoride, // 26
    Folate // 12
  case FolicAcid = "Folic Acid" // 11
  case Iodine, // 10
    Iron, // 9
    Manganese, // 8
    Magnesium,
    Phosphorus,
    Potassium,
    Protein // 35
  case SaturatedFat = "Saturated Fat" // 25
  case Selenium,
    Sodium,
    Sugar
  case VitaminA = "Vitamin A" // 24
  case VitaminB1 = "Vitamin B1" // 19
  case VitaminB2 = "Vitamin B2" // 18
  case VitaminB3 = "Vitamin B3" // 16
  case VitaminB5 = "Vitamin B5" // 17
  case VitaminB6 = "Vitamin B6" // 15
  case VitaminB12 = "Vitamin B12" // 14
  case VitaminC = "Vitamin C" // 23
  case VitaminD = "Vitamin D" // 22
  case VitaminE = "Vitamin E" // 21
  case VitaminK = "Vitamin K" // 20
  case Zinc
}
