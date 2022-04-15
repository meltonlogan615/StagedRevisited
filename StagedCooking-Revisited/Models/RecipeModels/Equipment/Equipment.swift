//
//  Equipment.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation

struct Equipment {
  var id: Int?
  var image: String?
  var name: String?
  var temperature: Temperature
}

struct Temperature {
  var number: Int?
  var unit: String?
}
