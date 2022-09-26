//
//  RestrictionsModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit

/**
 Basic view to display a list  of `macros`.
 
 `dietInfo` property value is received from and assigned via `convenience init` called in `RecipeViewController`
 
  Could be better done via looping through `Diets.allCases` to generate content?
 */

class DietsModal: SCModal {
  
  var dietInfo: DietInfo?
  
  var dietsLabel = LargeLabel()
  var whole30Label = LargeLabel()
  var veganLabel = LargeLabel()
  var vegetarianLabel = LargeLabel()
  var dairyFreeLabel = LargeLabel()
  var glutenFreeLabel = LargeLabel()
  var ketoLabel = LargeLabel()
  var lowFodmapLabel = LargeLabel()
  var veryHealthyLabel = LargeLabel()
  var healthScoreLabel = LargeLabel()
  var wwSmartPointsLabel = LargeLabel()
  var labels = [LargeLabel]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    labels = [dietsLabel, whole30Label, veganLabel, vegetarianLabel, dairyFreeLabel, glutenFreeLabel, ketoLabel, lowFodmapLabel, veryHealthyLabel, healthScoreLabel, wwSmartPointsLabel]
    style()
    layout()
  }
  
  convenience init(info: DietInfo) {
    self.init()
    self.dietInfo = info
    guard let modalData = self.dietInfo else { return }
    styleDietLabels(with: modalData)
    layoutDietLabels(with: modalData)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension DietsModal {
  func styleDietLabels(with info: DietInfo) {
    dietsLabel.translatesAutoresizingMaskIntoConstraints = false
    dietsLabel.text = info.diets
    dietsLabel.tag = 0

    veryHealthyLabel.translatesAutoresizingMaskIntoConstraints = false
    veryHealthyLabel.text = info.veryHealthy
    
    healthScoreLabel.translatesAutoresizingMaskIntoConstraints = false
    healthScoreLabel.text = info.healthScore
    
    whole30Label.translatesAutoresizingMaskIntoConstraints = false
    whole30Label.text = info.whole30
    
    veganLabel.translatesAutoresizingMaskIntoConstraints = false
    veganLabel.text = info.vegan
    
    vegetarianLabel.translatesAutoresizingMaskIntoConstraints = false
    vegetarianLabel.text = info.vegetarian
    
    dairyFreeLabel.translatesAutoresizingMaskIntoConstraints = false
    dairyFreeLabel.text = info.dairyFree
    
    glutenFreeLabel.translatesAutoresizingMaskIntoConstraints = false
    glutenFreeLabel.text = info.glutenFree
    
    ketoLabel.translatesAutoresizingMaskIntoConstraints = false
    ketoLabel.text = info.keto
    
    lowFodmapLabel.translatesAutoresizingMaskIntoConstraints = false
    lowFodmapLabel.text = info.lowFodmap
    
    wwSmartPointsLabel.translatesAutoresizingMaskIntoConstraints = false
    wwSmartPointsLabel.text = info.wwSmartPoints
  }
  
  func layoutDietLabels(with info: DietInfo) {
    
    for label in labels {
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      if label.text == "" {
        continue
      } else {
        detailsStack.addArrangedSubview(label)
        detailsStack.addArrangedSubview(divider)
      }
    }
  }
}

