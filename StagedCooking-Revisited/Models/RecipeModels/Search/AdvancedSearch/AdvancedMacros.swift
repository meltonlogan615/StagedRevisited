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
  case minCarbs = "Min Carbs"
  case maxCarb = "Max Carbs"

  case minProtein = "Min Protein"
  case maxProtein = "Max Protein"

  case minCalories = "Min Calories"
  case maxCalories = "Max Calories"

  case minFat = "Min Fat"
  case maxFat = "Max Fat"
  
  case minAlcohol = "Min Alcohol"
  case maxAlcohol = "Max Alcohol"
  
  case minCaffeine = "Min Caffeine"
  case maxCaffeine = "Max Caffeine"
  
  case minCopper = "Min Copper"
  case maxCopper = "Max Copper"
  
  case minCalcium = "Min Calcium"
  case maxCalcium = "Max Calcium"
  
  case minCholine = "Min Choline"
  case maxCholine = "Max Choline"
  
  case minCholesterol = "Min Cholesterol"
  case maxCholesterol = "Max Cholesterol"
  
  case minFluoride = "Min Fluoride"
  case maxFluoride = "Max Fluoride"
  
  case minSaturatedFat = "Min Saturated Fat"
  case maxSaturatedFat = "Max Saaturated Fat"
  
  case minVitaminA = "Min Vitamin A"
  case maxVitaminA = "Max Vitamin A"
  
  case minVitaminC = "Min Vitamin C"
  case maxVitaminC = "Max Vitamin C"
  
  case minVitaminD = "Min Vitamin D"
  case maxVitaminD = "Max Vitamin D"
  
  case minVitaminE = "Min Vitamin E"
  case maxVitaminE = "Max Vitamin E"
  
  case minVitaminK = "Min Vitamin K"
  case maxVitaminK = "Max Vitamin K"
  
  case minVitaminB1 = "Min Vitamin B1"
  case maxVitaminB1 = "Max Vitamin B1"
  
  case minVitaminB2 = "Min Vitamin B2"
  case maxVitaminB2 = "Max Vitamin B2"
  
  case minVitaminB5 = "Min Vitamin B5"
  case maxVitaminB5 = "Max Vitamin B5"
  
  case minVitaminB3 = "Min Vitamin B3"
  case maxVitaminB3 = "Max Vitamin B3"
  
  case minVitaminB6 = "Min Vitamin B6"
  case maxVitaminB6 = "Max Vitamin B6"
  
  case minVitaminB12 = "Min Vitamin B12"
  case maxVitaminB12 = "Max Vitamin B12"
  
  case minFiber = "Min Fiber"
  case maxFiber = "Max Fiber"
  
  case minFolate = "Min Folate"
  case maxFolate = "Max Folate"
  
  case minFolicAcid = "Min Folic Acid"
  case maxFolicAcid = "Max Folic Acid"
  
  case minIodine = "Min Iodine"
  case maxIodine = "Max Iodine"

  case minIron = "Min Iron"
  case maxIron = "Max Iron"

  case minMagnesium = "Min Magnesium"
  case maxMagnesium = "Max Magnesium"
  
  case minManganese = "Min Mangenese"
  case maxManganese = "Max Manganese"
  
  case minPhosphorus = "Min Phosphorus"
  case maxPhosphorus = "Max Phsophorus"
  
  case minPotassium = "Min Potassium"
  case maxPotassium = "Max Potassium"
  
  case minSelenium = "Min Selenium"
  case maxSelenium = "Max Selenium"
  
  case minSodium = "Min Sodium"
  case maxSodium = "Max Sodium"
  
  case minSugar = "Min Sugar"
  case maxSugar = "Max Sugar"
  
  case minZinc = "Min Zinc"
  case maxZinc = "Max Zinc"
}

enum MacrosForSpin: String, CaseIterable {
    case SelectMacro = "-- Select Macro --"
case Alcohol,
    Caffeine,
    Carbs,
    Calcium,
    Calories,
    Cholesterol,
    Choline,
    Copper,
    Fat,
    Fiber,
    Fluoride,
    Folate
  case FolicAcid = "Folic Acid"
  case Iodine,
    Iron,
    Manganese,
    Magnesium,
    Phosphorus,
    Potassium,
    Protein
  case SaturatedFat = "Saturated Fat"
  case Selenium,
    Sodium,
    Sugar
  case VitaminA = "Vitamin A"
  case VitaminB1 = "Vitamin B1"
  case VitaminB2 = "Vitamin B2"
  case VitaminB3 = "Vitamin B3"
  case VitaminB5 = "Vitamin B5"
  case VitaminB6 = "Vitamin B6"
  case VitaminB12 = "Vitamin B12"
  case VitaminC = "Vitamin C"
  case VitaminD = "Vitamin D"
  case VitaminE = "Vitamin E"
  case VitaminK = "Vitamin K"
  case Zinc
}
