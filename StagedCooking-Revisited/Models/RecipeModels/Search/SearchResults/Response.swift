//
//  Response.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation


struct Response: Decodable {
  var results: [SearchResult]?
  var baseUri: String?
  var number: Int?
  var offset: Int?
  var totalResults: Int?
  var processingTimeMs: Int?
  var expires: Int?
  var isStale: Bool?
}
