//
//  IncludeExcludeSeg.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/22/22.
//

import Foundation
import UIKit

class IncludeExcludeSeg: UIView {
  
  let seg = UISegmentedControl(items: ["Include", "Exclude"])
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension IncludeExcludeSeg {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    seg.translatesAutoresizingMaskIntoConstraints = false
    seg.tintColor = UIColor.white // not sure what this does
    seg.selectedSegmentTintColor = K.modalBG // color of the tab
    switch seg.selectedSegmentIndex {
      case 0:
        seg.backgroundColor = K.scGreen
      case 1:
        seg.backgroundColor = K.scAccent
      default:
        break
    }
//    seg.backgroundColor = K.scGreen // background of the segementedController
  }
  
  func layout() {
    addSubview(seg)
    NSLayoutConstraint.activate([
      seg.topAnchor.constraint(equalTo: topAnchor),
      seg.leadingAnchor.constraint(equalTo: leadingAnchor),
      seg.trailingAnchor.constraint(equalTo: trailingAnchor),
      seg.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

class TestSegmented: UISegmentedControl {
  
//  convenience override init(frame: CGRect) {
//    self.init(frame: frame)
//    translatesAutoresizingMaskIntoConstraints = false
//    tintColor = UIColor.white
//    selectedSegmentTintColor = K.modalBG
//  }
  
  convenience override init(items: [Any]?) {
    self.init(items: ["Include", "Exclude"])
    translatesAutoresizingMaskIntoConstraints = false
    tintColor = UIColor.white
    selectedSegmentTintColor = K.modalBG
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
