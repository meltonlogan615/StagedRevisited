////
////  AdvancedMacrosMethod.swift
////  StagedCooking-Revisited
////
////  Created by Logan Melton on 5/18/22.
////
//
//import Foundation
//import UIKit
//
//extension UIViewController {
//  func macroString(from macros: [AdvancedMacros]) -> String {
//    var returnString = String()
//    for macro in macros {
//      switch macro {
//        case .minCarbs(let amount):
//          if returnString.isEmpty {
//            returnString = "minCarbs=\(amount)"
//          } else {
//            returnString += "&minCarbs=\(amount)"
//          }
//          
//        case .maxCarb(let amount):
//          if returnString.isEmpty {
//            returnString = "maxCarb=\(amount)"
//          } else {
//            returnString += "&maxCarb=\(amount)"
//          }
//          
//        case .minProtein(let amount):
//          if returnString.isEmpty {
//            returnString = "minProtein=\(amount)"
//          } else {
//            returnString += "&minProtein=\(amount)"
//          }
//          
//        case .maxProtein(let amount):
//          if returnString.isEmpty {
//            returnString = "maxProtein=\(amount)"
//          } else {
//            returnString += "&maxProtein=\(amount)"
//          }
//          
//        case .minCalories(let amount):
//          if returnString.isEmpty {
//            returnString = "minCalories=\(amount)"
//          } else {
//            returnString += "&minCalories=\(amount)"
//          }
//          
//        case .maxCalories(let amount):
//          if returnString.isEmpty {
//            returnString = "returnString=\(amount)"
//          } else {
//            returnString += "&returnString=\(amount)"
//          }
//          
//        case .minFat(let amount):
//          if returnString.isEmpty {
//            returnString = "minFat=\(amount)"
//          } else {
//            returnString += "&minFat=\(amount)"
//          }
//          
//        case .maxFat(let amount):
//          if returnString.isEmpty {
//            returnString = "maxFat=\(amount)"
//          } else {
//            returnString += "&maxFat=\(amount)"
//          }
//          
//        case .minAlcohol(let amount):
//          if returnString.isEmpty {
//            returnString = "minAlcohol=\(amount)"
//          } else {
//            returnString += "&minAlcohol=\(amount)"
//          }
//          
//        case .maxAlcohol(let amount):
//          if returnString.isEmpty {
//            returnString = "maxAlcohol=\(amount)"
//          } else {
//            returnString += "&maxAlcohol=\(amount)"
//          }
//          
//        case .minCaffeine(let amount):
//          if returnString.isEmpty {
//            returnString = "minCaffeine=\(amount)"
//          } else {
//            returnString += "&minCaffeine=\(amount)"
//          }
//          
//        case .maxCaffeine(let amount):
//          if returnString.isEmpty {
//            returnString = "maxCaffeine=\(amount)"
//          } else {
//            returnString += "&maxCaffeine=\(amount)"
//          }
//          
//        case .minCopper(let amount):
//          if returnString.isEmpty {
//            returnString = "minCopper=\(amount)"
//          } else {
//            returnString += "&minCopper=\(amount)"
//          }
//          
//        case .maxCopper(let amount):
//          if returnString.isEmpty {
//            returnString = "maxCopper=\(amount)"
//          } else {
//            returnString += "&maxCopper=\(amount)"
//          }
//          
//        case .minCalcium(let amount):
//          if returnString.isEmpty {
//            returnString = "minCalcium=\(amount)"
//          } else {
//            returnString += "&minCalcium=\(amount)"
//          }
//          
//        case .maxCalcium(let amount):
//          if returnString.isEmpty {
//            returnString = "maxCalcium=\(amount)"
//          } else {
//            returnString += "&maxCalcium=\(amount)"
//          }
//          
//        case .minCholine(let amount):
//          if returnString.isEmpty {
//            returnString = "minCholine=\(amount)"
//          } else {
//            returnString += "&minCholine=\(amount)"
//          }
//          
//        case .maxCholine(let amount):
//          if returnString.isEmpty {
//            returnString = "maxCholine=\(amount)"
//          } else {
//            returnString += "&maxCholine=\(amount)"
//          }
//          
//        case .minCholesterol(let amount):
//          if returnString.isEmpty {
//            returnString = "minCholesterol=\(amount)"
//          } else {
//            returnString += "&minCholesterol=\(amount)"
//          }
//          
//        case .maxCholesterol(let amount):
//          if returnString.isEmpty {
//            returnString = "maxCholesterol=\(amount)"
//          } else {
//            returnString += "&maxCholesterol=\(amount)"
//          }
//          
//        case .minFluoride(let amount):
//          if returnString.isEmpty {
//            returnString = "minFluoride=\(amount)"
//          } else {
//            returnString += "&minFluoride=\(amount)"
//          }
//          
//        case .maxFluoride(let amount):
//          if returnString.isEmpty {
//            returnString = "maxFluoride=\(amount)"
//          } else {
//            returnString += "&maxFluoride=\(amount)"
//          }
//          
//        case .minSaturatedFat(let amount):
//          if returnString.isEmpty {
//            returnString = "minSaturatedFat=\(amount)"
//          } else {
//            returnString += "&minSaturatedFat=\(amount)"
//          }
//          
//        case .maxSaturatedFat(let amount):
//          if returnString.isEmpty {
//            returnString = "maxSaturatedFat=\(amount)"
//          } else {
//            returnString += "&maxSaturatedFat=\(amount)"
//          }
//          
//        case .minVitaminA(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminA=\(amount)"
//          } else {
//            returnString += "&minVitaminA=\(amount)"
//          }
//          
//        case .maxVitaminA(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminA=\(amount)"
//          } else {
//            returnString += "&maxVitaminA=\(amount)"
//          }
//          
//        case .minVitaminC(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminC=\(amount)"
//          } else {
//            returnString += "&minVitaminC=\(amount)"
//          }
//          
//        case .maxVitaminC(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminC=\(amount)"
//          } else {
//            returnString += "&maxVitaminC=\(amount)"
//          }
//          
//        case .minVitaminD(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminD=\(amount)"
//          } else {
//            returnString += "&minVitaminD=\(amount)"
//          }
//          
//        case .maxVitaminD(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminD=\(amount)"
//          } else {
//            returnString += "&maxVitaminD=\(amount)"
//          }
//          
//        case .minVitaminE(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminE=\(amount)"
//          } else {
//            returnString += "&minVitaminE=\(amount)"
//          }
//          
//        case .maxVitaminE(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminE=\(amount)"
//          } else {
//            returnString += "&maxVitaminE=\(amount)"
//          }
//          
//        case .minVitaminK(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminK=\(amount)"
//          } else {
//            returnString += "&minVitaminK=\(amount)"
//          }
//          
//        case .maxVitaminK(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminK=\(amount)"
//          } else {
//            returnString += "&maxVitaminK=\(amount)"
//          }
//          
//        case .minVitaminB1(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminB1=\(amount)"
//          } else {
//            returnString += "&minVitaminB1=\(amount)"
//          }
//          
//        case .maxVitaminB1(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminB1=\(amount)"
//          } else {
//            returnString += "&maxVitaminB1=\(amount)"
//          }
//          
//        case .minVitaminB2(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminB2=\(amount)"
//          } else {
//            returnString += "&minVitaminB2=\(amount)"
//          }
//          
//        case .maxVitaminB2(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminB2=\(amount)"
//          } else {
//            returnString += "&maxVitaminB2=\(amount)"
//          }
//          
//        case .minVitaminB5(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminB5=\(amount)"
//          } else {
//            returnString += "&minVitaminB5=\(amount)"
//          }
//          
//        case .maxVitaminB5(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminB5=\(amount)"
//          } else {
//            returnString += "&maxVitaminB5=\(amount)"
//          }
//          
//        case .minVitaminB3(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminB3=\(amount)"
//          } else {
//            returnString += "&minVitaminB3=\(amount)"
//          }
//          
//        case .maxVitaminB3(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminB3=\(amount)"
//          } else {
//            returnString += "&maxVitaminB3=\(amount)"
//          }
//          
//        case .minVitaminB6(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminB6=\(amount)"
//          } else {
//            returnString += "&minVitaminB6=\(amount)"
//          }
//          
//        case .maxVitaminB6(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminB6=\(amount)"
//          } else {
//            returnString += "&maxVitaminB6=\(amount)"
//          }
//          
//        case .minVitaminB12(let amount):
//          if returnString.isEmpty {
//            returnString = "minVitaminB12=\(amount)"
//          } else {
//            returnString += "&minVitaminB12=\(amount)"
//          }
//          
//        case .maxVitaminB12(let amount):
//          if returnString.isEmpty {
//            returnString = "maxVitaminB12=\(amount)"
//          } else {
//            returnString += "&maxVitaminB12=\(amount)"
//          }
//          
//        case .minFiber(let amount):
//          if returnString.isEmpty {
//            returnString = "minFiber=\(amount)"
//          } else {
//            returnString += "&minFiber=\(amount)"
//          }
//          
//        case .maxFiber(let amount):
//          if returnString.isEmpty {
//            returnString = "maxFiber=\(amount)"
//          } else {
//            returnString += "&maxFiber=\(amount)"
//          }
//          
//        case .minFolate(let amount):
//          if returnString.isEmpty {
//            returnString = "minFolate=\(amount)"
//          } else {
//            returnString += "&minFolate=\(amount)"
//          }
//          
//        case .maxFolate(let amount):
//          if returnString.isEmpty {
//            returnString = "maxFolate=\(amount)"
//          } else {
//            returnString += "&maxFolate=\(amount)"
//          }
//          
//        case .minFolicAcid(let amount):
//          if returnString.isEmpty {
//            returnString = "minFolicAcid=\(amount)"
//          } else {
//            returnString += "&minFolicAcid=\(amount)"
//          }
//          
//        case .maxFolicAcid(let amount):
//          if returnString.isEmpty {
//            returnString = "maxFolicAcid=\(amount)"
//          } else {
//            returnString += "&maxFolicAcid=\(amount)"
//          }
//          
//        case .minIodine(let amount):
//          if returnString.isEmpty {
//            returnString = "minIodine=\(amount)"
//          } else {
//            returnString += "&minIodine=\(amount)"
//          }
//          
//        case .maxIodine(let amount):
//          if returnString.isEmpty {
//            returnString = "maxIodine=\(amount)"
//          } else {
//            returnString += "&maxIodine=\(amount)"
//          }
//          
//        case .minIron(let amount):
//          if returnString.isEmpty {
//            returnString = "minIron=\(amount)"
//          } else {
//            returnString += "&minIron=\(amount)"
//          }
//        case .maxIron(let amount):
//          if returnString.isEmpty {
//            returnString = "maxIron=\(amount)"
//          } else {
//            returnString += "&maxIron=\(amount)"
//          }
//          
//        case .minMagnesium(let amount):
//          if returnString.isEmpty {
//            returnString = "minMagnesium=\(amount)"
//          } else {
//            returnString += "&minMagnesium=\(amount)"
//          }
//        case .maxMagnesium(let amount):
//          if returnString.isEmpty {
//            returnString = "maxMagnesium=\(amount)"
//          } else {
//            returnString += "&maxMagnesium=\(amount)"
//          }
//          
//        case .minManganese(let amount):
//          if returnString.isEmpty {
//            returnString = "minManganese=\(amount)"
//          } else {
//            returnString += "&minManganese=\(amount)"
//          }
//        case .maxManganese(let amount):
//          if returnString.isEmpty {
//            returnString = "maxManganese=\(amount)"
//          } else {
//            returnString += "&maxManganese=\(amount)"
//          }
//          
//        case .minPhosphorus(let amount):
//          if returnString.isEmpty {
//            returnString = "minPhosphorus=\(amount)"
//          } else {
//            returnString += "&minPhosphorus=\(amount)"
//          }
//          
//        case .maxPhosphorus(let amount):
//          if returnString.isEmpty {
//            returnString = "maxPhosphorus=\(amount)"
//          } else {
//            returnString += "&maxPhosphorus=\(amount)"
//          }
//          
//        case .minPotassium(let amount):
//          if returnString.isEmpty {
//            returnString = "minPotassium=\(amount)"
//          } else {
//            returnString += "&minPotassium=\(amount)"
//          }
//          
//        case .maxPotassium(let amount):
//          if returnString.isEmpty {
//            returnString = "maxPotassium=\(amount)"
//          } else {
//            returnString += "&maxPotassium=\(amount)"
//          }
//          
//        case .minSelenium(let amount):
//          if returnString.isEmpty {
//            returnString = "minSelenium=\(amount)"
//          } else {
//            returnString += "&minSelenium=\(amount)"
//          }
//          
//        case .maxSelenium(let amount):
//          if returnString.isEmpty {
//            returnString = "maxSelenium=\(amount)"
//          } else {
//            returnString += "&maxSelenium=\(amount)"
//          }
//          
//        case .minSodium(let amount):
//          if returnString.isEmpty {
//            returnString = "minSodium=\(amount)"
//          } else {
//            returnString += "&minSodium=\(amount)"
//          }
//          
//        case .maxSodium(let amount):
//          if returnString.isEmpty {
//            returnString = "maxSodium=\(amount)"
//          } else {
//            returnString += "&maxSodium=\(amount)"
//          }
//          
//        case .minSugar(let amount):
//          if returnString.isEmpty {
//            returnString = "minSugar=\(amount)"
//          } else {
//            returnString += "&minSugar=\(amount)"
//          }
//          
//        case .maxSugar(let amount):
//          if returnString.isEmpty {
//            returnString = "maxSugar=\(amount)"
//          } else {
//            returnString += "&maxSugar=\(amount)"
//          }
//          
//        case .minZinc(let amount):
//          if returnString.isEmpty {
//            returnString = "minZinc=\(amount)"
//          } else {
//            returnString += "&minZinc=\(amount)"
//          }
//          
//        case .maxZinc(let amount):
//          if returnString.isEmpty {
//            returnString = "maxZinc=\(amount)"
//          } else {
//            returnString += "&maxZinc=\(amount)"
//          }
//      }
//    }
//    return returnString
//  }
//}
