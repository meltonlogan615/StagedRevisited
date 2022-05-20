//
//  SearchResult.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

struct SearchResult: Decodable, Identifiable, Comparable, Hashable {
  var id: Int?
  var title: String?
  var calories: Int?
  var carbs: String?
  var fat: String?
  var protein: String?
  
  var image: String?
  var imageType: String?
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    var result = false
    if let leftTitle = lhs.title {
      if let rightTitle = rhs.title {
        result = leftTitle < rightTitle
      }
    }
    return result
  }
}


