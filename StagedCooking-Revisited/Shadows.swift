//
//  NotDarkYet.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/27/22.
//

import Foundation
import UIKit

extension UIView {
  func notDarkYet() {
    print("It's not dark yet...")
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = CGSize(width: 2, height: 2)
    self.layer.shadowRadius = 2
    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    print("but it's getting there.")
  }
}
