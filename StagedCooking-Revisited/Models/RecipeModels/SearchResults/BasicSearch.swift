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
  var image: String? // just image name & extension, not url as that is below. May be useful as Alt-Text?
  var imageURL: String? // full url
  
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
