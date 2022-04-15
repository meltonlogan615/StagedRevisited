//
//  Instructions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation


struct Instructions: Decodable, Hashable {
  var name: String?
  var steps: [Step]?
}

struct InstructionResults: Decodable, Hashable {
  var results: [Instructions]?
}


