//
//  SelfConfiguringCell.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 9/30/22.
//

import UIKit

protocol SelfConfiguringCell {
  static var reuseIdentifier: String { get }
  func configure(with app: Recipe)
}
