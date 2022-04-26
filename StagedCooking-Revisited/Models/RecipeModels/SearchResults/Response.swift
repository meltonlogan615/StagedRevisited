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
  var totalResults: Int? // total number of items in the Response, will need to tinker with to understand cost of user activities
  var processingTimeMs: Int?
  var expires: Int?
  var isStale: Bool?
}
