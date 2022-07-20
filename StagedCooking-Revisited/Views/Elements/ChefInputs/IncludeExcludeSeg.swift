//
//  IncludeExcludeSeg.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/22/22.
//

import Foundation
import UIKit

class IncludeExcludeSeg: UISegmentedControl {
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    style()
//    layout()
  }
  
  override init(items: [Any]?) {
    let items = ["Include", "Exclude"]
//    items = items
//    layout()
    super.init(items: items)
    style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension IncludeExcludeSeg {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    tintColor = UIColor.white // not sure what this does
    selectedSegmentTintColor = K.modalBG // color of the tab
    frame.size = CGSize(width: 100, height: 50)
  }
  
//  func layout() {
//    addSubview(seg)
//    NSLayoutConstraint.activate([
//      topAnchor.constraint(equalTo: topAnchor),
//      leadingAnchor.constraint(equalTo: leadingAnchor),
//      trailingAnchor.constraint(equalTo: trailingAnchor),
//      bottomAnchor.constraint(equalTo: bottomAnchor)
//    ])
//  }
}
//
//class TestSegmented: UISegmentedControl {
//
//  convenience override init(items: [Any]?) {
//
//    self.init(items: items)
//    translatesAutoresizingMaskIntoConstraints = false
//    tintColor = UIColor.white
//    selectedSegmentTintColor = K.modalBG
//  }
//
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}
