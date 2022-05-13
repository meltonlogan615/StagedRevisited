//
//  MacrosModel.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/10/22.
//

import Foundation

struct Macros: Codable {
  var name: String
  var amount: Double
  var unit: String
  var percentOfDailyNeeds: Double
}
