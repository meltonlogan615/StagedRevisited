//
//  IntolerancesView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class IntolerancesView: AdvancedSearch {
  
  var viewTitle = "Intolerances"
  
  var dairyRow = AdvancedSearchRow()
  var dairyLabel = ModalLabel()
  var dairySwitch = ToggleSwitch()
  var divOne = Divider()
  
  var eggRow = AdvancedSearchRow()
  var eggLabel = ModalLabel()
  var eggSwitch = ToggleSwitch()
  var divTwo = Divider()
  
  var glutenRow = AdvancedSearchRow()
  var glutenLabel = ModalLabel()
  var glutenSwitch = UISwitch()
  var divThree = Divider()

  var grainRow = AdvancedSearchRow()
  var grainLabel = ModalLabel()
  var grainSwitch = UISwitch()
  var divFour = Divider()
  
  var peanutRow = AdvancedSearchRow()
  var peanutLabel = ModalLabel()
  var peanutSwitch = UISwitch()
  var divFive = Divider()

  var seafoodRow = AdvancedSearchRow()
  var seafoodLabel = ModalLabel()
  var seafoodSwitch = UISwitch()
  var divSix = Divider()

  var sesameRow = AdvancedSearchRow()
  var sesameLabel = ModalLabel()
  var sesameSwitch = UISwitch()
  var divSeven = Divider()
  
  var shellfishRow = AdvancedSearchRow()
  var shellfishLabel = ModalLabel()
  var shellfishSwitch = UISwitch()
  var divEight = Divider()

  var soyRow = AdvancedSearchRow()
  var soyLabel = ModalLabel()
  var soySwitch = UISwitch()
  var divNine = Divider()

  var sulfiteRow = AdvancedSearchRow()
  var sulfiteLabel = ModalLabel()
  var sulfiteSwitch = UISwitch()
  var divTen = Divider()

  var treeNutRow = AdvancedSearchRow()
  var treeNutLabel = ModalLabel()
  var treeNutSwitch = UISwitch()
  var divEleven = Divider()
  
  var wheatRow = AdvancedSearchRow()
  var wheatLabel = ModalLabel()
  var wheatSwitch = UISwitch()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    styleSwitchesAndLabels()
    layoutSwitchesAndLabels()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension IntolerancesView {
  private func styleSwitchesAndLabels() {
    
    dairyRow.translatesAutoresizingMaskIntoConstraints = false
    dairyLabel.translatesAutoresizingMaskIntoConstraints = false
    dairyLabel.text = "Exclude Dairy"
    dairySwitch.translatesAutoresizingMaskIntoConstraints = false
    divOne.translatesAutoresizingMaskIntoConstraints = false
    
    eggRow.translatesAutoresizingMaskIntoConstraints = false
    eggLabel.translatesAutoresizingMaskIntoConstraints = false
    eggLabel.text = "Exclude Eggs"
    eggSwitch.translatesAutoresizingMaskIntoConstraints = false
    divTwo.translatesAutoresizingMaskIntoConstraints = false
    
    glutenRow.translatesAutoresizingMaskIntoConstraints = false
    glutenLabel.translatesAutoresizingMaskIntoConstraints = false
    glutenLabel.text = "Exclude Gluten"
    glutenSwitch.translatesAutoresizingMaskIntoConstraints = false
    divThree.translatesAutoresizingMaskIntoConstraints = false
    
    grainRow.translatesAutoresizingMaskIntoConstraints = false
    grainLabel.translatesAutoresizingMaskIntoConstraints = false
    grainLabel.text = "Exclude Grains"
    grainSwitch.translatesAutoresizingMaskIntoConstraints = false
    divFour.translatesAutoresizingMaskIntoConstraints = false

    peanutRow.translatesAutoresizingMaskIntoConstraints = false
    peanutLabel.translatesAutoresizingMaskIntoConstraints = false
    peanutLabel.text = "Exclude Peanuts"
    peanutSwitch.translatesAutoresizingMaskIntoConstraints = false
    divFive.translatesAutoresizingMaskIntoConstraints = false
    
    seafoodRow.translatesAutoresizingMaskIntoConstraints = false
    seafoodLabel.translatesAutoresizingMaskIntoConstraints = false
    seafoodLabel.text = "Exclude Seafood"
    seafoodSwitch.translatesAutoresizingMaskIntoConstraints = false
    divSix.translatesAutoresizingMaskIntoConstraints = false
    
    sesameRow.translatesAutoresizingMaskIntoConstraints = false
    sesameLabel.translatesAutoresizingMaskIntoConstraints = false
    sesameLabel.text = "Exclude Sesame"
    sesameSwitch.translatesAutoresizingMaskIntoConstraints = false
    divSeven.translatesAutoresizingMaskIntoConstraints = false

    shellfishRow.translatesAutoresizingMaskIntoConstraints = false
    shellfishLabel.translatesAutoresizingMaskIntoConstraints = false
    shellfishLabel.text = "Exclude Shellfish"
    shellfishSwitch.translatesAutoresizingMaskIntoConstraints = false
    divEight.translatesAutoresizingMaskIntoConstraints = false

    soyRow.translatesAutoresizingMaskIntoConstraints = false
    soyLabel.translatesAutoresizingMaskIntoConstraints = false
    soyLabel.text = "Exclude Soy"
    soySwitch.translatesAutoresizingMaskIntoConstraints = false
    divNine.translatesAutoresizingMaskIntoConstraints = false

    sulfiteRow.translatesAutoresizingMaskIntoConstraints = false
    sulfiteLabel.translatesAutoresizingMaskIntoConstraints = false
    sulfiteLabel.text = "Exclude Sulfites"
    sulfiteSwitch.translatesAutoresizingMaskIntoConstraints = false
    divTen.translatesAutoresizingMaskIntoConstraints = false

    treeNutRow.translatesAutoresizingMaskIntoConstraints = false
    treeNutLabel.translatesAutoresizingMaskIntoConstraints = false
    treeNutLabel.text = "Exclude Tree Nuts"
    treeNutSwitch.translatesAutoresizingMaskIntoConstraints = false
    divEleven.translatesAutoresizingMaskIntoConstraints = false

    wheatRow.translatesAutoresizingMaskIntoConstraints = false
    wheatLabel.translatesAutoresizingMaskIntoConstraints = false
    wheatLabel.text = "Exclude Wheat"
    wheatSwitch.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func layoutSwitchesAndLabels() {
    dairyRow.addArrangedSubview(dairyLabel)
    dairyRow.addArrangedSubview(dairySwitch)
    detailsStack.addArrangedSubview(dairyRow)
    detailsStack.addArrangedSubview(divOne)
    
    eggRow.addArrangedSubview(eggLabel)
    eggRow.addArrangedSubview(eggSwitch)
    detailsStack.addArrangedSubview(eggRow)
    detailsStack.addArrangedSubview(divTwo)

    glutenRow.addArrangedSubview(glutenLabel)
    glutenRow.addArrangedSubview(glutenSwitch)
    detailsStack.addArrangedSubview(glutenRow)
    detailsStack.addArrangedSubview(divThree)

    grainRow.addArrangedSubview(grainLabel)
    grainRow.addArrangedSubview(grainSwitch)
    detailsStack.addArrangedSubview(grainRow)
    detailsStack.addArrangedSubview(divFour)

    peanutRow.addArrangedSubview(peanutLabel)
    peanutRow.addArrangedSubview(peanutSwitch)
    detailsStack.addArrangedSubview(peanutRow)
    detailsStack.addArrangedSubview(divFive)

    seafoodRow.addArrangedSubview(seafoodLabel)
    seafoodRow.addArrangedSubview(seafoodSwitch)
    detailsStack.addArrangedSubview(seafoodRow)
    detailsStack.addArrangedSubview(divSix)

    sesameRow.addArrangedSubview(sesameLabel)
    sesameRow.addArrangedSubview(sesameSwitch)
    detailsStack.addArrangedSubview(sesameRow)
    detailsStack.addArrangedSubview(divSeven)

    shellfishRow.addArrangedSubview(shellfishLabel)
    shellfishRow.addArrangedSubview(shellfishSwitch)
    detailsStack.addArrangedSubview(shellfishRow)
    detailsStack.addArrangedSubview(divEight)

    soyRow.addArrangedSubview(soyLabel)
    soyRow.addArrangedSubview(soySwitch)
    detailsStack.addArrangedSubview(soyRow)
    detailsStack.addArrangedSubview(divNine)

    sulfiteRow.addArrangedSubview(sulfiteLabel)
    sulfiteRow.addArrangedSubview(sulfiteSwitch)
    detailsStack.addArrangedSubview(sulfiteRow)
    detailsStack.addArrangedSubview(divTen)

    treeNutRow.addArrangedSubview(treeNutLabel)
    treeNutRow.addArrangedSubview(treeNutSwitch)
    detailsStack.addArrangedSubview(treeNutRow)
    detailsStack.addArrangedSubview(divEleven)

    wheatRow.addArrangedSubview(wheatLabel)
    wheatRow.addArrangedSubview(wheatSwitch)
    detailsStack.addArrangedSubview(wheatRow)
  }
}
