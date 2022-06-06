//
//  UILableKerning.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/2/22.
//

import Foundation
import UIKit

extension UILabel {
  /**
   Extension on `UILabel` to add a bit more letter spacing.
   
   Example usage:
   let label = UILabel()
   label.addKerning(to: "Hello")
   */
  func addKerning(to text: String) {
    let spaced = [NSAttributedString.Key.kern: 1]
    let spacyString = NSMutableAttributedString(string: text.capitalized, attributes: spaced)
    self.attributedText = spacyString
  }
}
