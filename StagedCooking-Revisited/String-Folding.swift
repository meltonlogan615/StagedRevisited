//
//  String-Folding.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/21/22.
//

import Foundation

extension String {
  /**
    Extension on any instance of `String.Type`.
   
   Removes any accent in a word's proper spelling into a `UTF-8` format that can be used with a `URL`.
   
   Example:  "ê" will be passed to `EndPoints.query` simpley as "e".
   */
  func unaccent() -> String {
    return self.folding(options: .diacriticInsensitive, locale: .current)
  }
}

