//
//  MacroPickerView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/21/22.
//
import Foundation
import UIKit

class MacroPickerView: UIView {
  
  let segController: UISegmentedControl = {
    let seg = UISegmentedControl(items: ["Minimum", "Maximum"])
    seg.translatesAutoresizingMaskIntoConstraints = false
    seg.tintColor = UIColor.white // not sure what this does
    seg.selectedSegmentTintColor = K.modalBG // color of the tab
    seg.backgroundColor = K.scGreen // background of the segementedController
    seg.selectedSegmentIndex = 0
    return seg
  }()
  
  let macroPicker = UIPickerView()
  var selection = String()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    //    macroPicker.dataSource = self
    //    macroPicker.delegate = self
    backgroundColor = .blue
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension MacroPickerView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    macroPicker.translatesAutoresizingMaskIntoConstraints = false
    macroPicker.becomeFirstResponder()
    addSubview(macroPicker)
    NSLayoutConstraint.activate([
      macroPicker.topAnchor.constraint(equalTo: topAnchor),
      macroPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
      macroPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
      macroPicker.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

//extension MacroPickerView: UIPickerViewDataSource {
//  func numberOfComponents(in pickerView: UIPickerView) -> Int {
//    return 1
//  }
//
//  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//    return AdvancedMacros.allCases.count
//  }
//
//  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//    return AdvancedMacros.allCases[row].rawValue
//  }
//}
//
//extension MacroPickerView: UIPickerViewDelegate {
//
//}
