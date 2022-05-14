//
//  RestrictionsModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation
import UIKit

class DietsModal: RecipeModal {
  
  var dietInfo: DietInfo?
  
  var dietsLabel = ModalLabel()
  var whole30Label = ModalLabel()
  var veganLabel = ModalLabel()
  var vegetarianLabel = ModalLabel()
  var dairyFreeLabel = ModalLabel()
  var glutenFreeLabel = ModalLabel()
  var ketoLabel = ModalLabel()
  var lowFodmapLabel = ModalLabel()
  var veryHealthyLabel = ModalLabel()
  var healthScoreLabel = ModalLabel()
  var wwSmartPointsLabel = ModalLabel()
  
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
    detailsStack.addArrangedSubview(dietsLabel)
    detailsStack.addArrangedSubview(veryHealthyLabel)
    detailsStack.addArrangedSubview(healthScoreLabel)
    detailsStack.addArrangedSubview(whole30Label)
    detailsStack.addArrangedSubview(veganLabel)
    detailsStack.addArrangedSubview(veganLabel)
    detailsStack.addArrangedSubview(dairyFreeLabel)
    detailsStack.addArrangedSubview(glutenFreeLabel)
    detailsStack.addArrangedSubview(ketoLabel)
    detailsStack.addArrangedSubview(lowFodmapLabel)
    detailsStack.addArrangedSubview(wwSmartPointsLabel)
  }
}

/*
 var dietsLabel: diets,
 var whole30Label: whole30,
 var veganLabel: vegan,
 var vegetarianLabel: vegetarian,
 var dairyFreeLabel: dairyFree,
 var glutenFreeLabel: glutenFree,
 var ketoLabel: keto,
 var lowFodmapLabel: lowFodmap,
 var veryHealthyLabel: veryHealthy,
 var healthScoreLabel: healthScore,
 var wwSmartPointsLabel: wwSmartPoints
 */
