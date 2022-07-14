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
 
  Could be better implamented via looping through `Diets.allCases` to generate content.
 */
class DietsModal: SCModal {
  
  var dietInfo: DietInfo?
  
  var dietsLabel = SCLabel()
  var whole30Label = SCLabel()
  var veganLabel = SCLabel()
  var vegetarianLabel = SCLabel()
  var dairyFreeLabel = SCLabel()
  var glutenFreeLabel = SCLabel()
  var ketoLabel = SCLabel()
  var lowFodmapLabel = SCLabel()
  var veryHealthyLabel = SCLabel()
  var healthScoreLabel = SCLabel()
  var wwSmartPointsLabel = SCLabel()
  let divider = Divider()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
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
    
    divider.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layoutDietLabels(with info: DietInfo) {
    
    detailsStack.addArrangedSubview(dietsLabel)
    detailsStack.addArrangedSubview(divider)
    
    detailsStack.addArrangedSubview(veryHealthyLabel)
    detailsStack.addArrangedSubview(divider)

    detailsStack.addArrangedSubview(healthScoreLabel)
    detailsStack.addArrangedSubview(divider)

    detailsStack.addArrangedSubview(whole30Label)
    detailsStack.addArrangedSubview(divider)

    detailsStack.addArrangedSubview(veganLabel)
    detailsStack.addArrangedSubview(veganLabel)
    detailsStack.addArrangedSubview(dairyFreeLabel)
    detailsStack.addArrangedSubview(glutenFreeLabel)
    detailsStack.addArrangedSubview(ketoLabel)
    detailsStack.addArrangedSubview(lowFodmapLabel)
    detailsStack.addArrangedSubview(wwSmartPointsLabel)
  }
}

