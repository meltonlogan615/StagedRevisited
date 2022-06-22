//
//  AdvancedMacrosView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class AdvancedMacrosView: UIView {
  
  let segController = UISegmentedControl(items: ["Minimum", "Maximum"])
  let pickerView = UIPickerView()
  
  let textField = LargeTextField()
  let confrimButton = ActionButton()
  
  let options = MacrosForSpin.allCases
  var selection = String()
  var addedOptions = [String]()
  let table = UITableView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AdvancedMacrosView {
  
  func styleMacros() {

  }
  
  func layoutMacros() {

  }
}
