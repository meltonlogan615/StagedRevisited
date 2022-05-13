//
//  ModalLabel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/13/22.
//

import Foundation
import UIKit

class ModalLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ModalLabel {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    font = .systemFont(ofSize: 20)
    numberOfLines = 0
    tintColor = UIColor(named: "SC-Primary-Reversed")
  }

}
