//
//  RemoveDups.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/16/22.
//

import Foundation

extension Array where Element: Hashable {
  func removingDuplicates() -> [Element] {
    var addedDict = [Element: Bool]()
    
    return filter {
      addedDict.updateValue(true, forKey: $0) == nil
    }
  }
  
  mutating func removeDuplicates() {
    self = self.removingDuplicates()
  }
}
