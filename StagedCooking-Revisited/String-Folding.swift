//
//  String-Folding.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/21/22.
//

import Foundation

extension String {
  func unaccent() -> String {
    return self.folding(options: .diacriticInsensitive, locale: .current)
  }
}

