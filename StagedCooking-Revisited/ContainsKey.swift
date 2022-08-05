//
//  ContainsKey.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/5/22.
//

import Foundation

extension Dictionary {
  func containsKey(_ key: Key) -> Bool {
    index(forKey: key) != nil
  }
}

// stolen from https://cocoacasts.com/swift-fundamentals-how-to-check-if-dictionary-contains-given-key
