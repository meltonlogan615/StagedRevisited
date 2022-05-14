//
//  BasicSearch.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation

struct BasicSearch: Decodable, Identifiable, Comparable, Hashable {
  var id: Int?
  var title: String?
  var readyInMinutes: Int?
  var image: String?
  var imageURL: String?
  
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
