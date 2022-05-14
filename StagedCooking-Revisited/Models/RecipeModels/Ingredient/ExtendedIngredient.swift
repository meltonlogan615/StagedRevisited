//
//  ExtendedIngredient.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

struct ExtendedIngredient: Codable, Hashable, Identifiable {
  var id: Int? 
  var name: String?
  var aisle: String?
  var image: String?
  var amount: Double?
  var consistency: String? 
  var meta: [String]?

  var nameClean: String?
  var original: String?
  var originalName: String?
}
