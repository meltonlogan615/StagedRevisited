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
  var number: Int? // total number of items to return from the Response (results.count =< number)
  var offset: Int? // how many reults to move forward (results.count + offset)
  var totalResults: Int? // total number of items in the Response
  var processingTimeMs: Int?
  var expires: Int?
  var isStale: Bool?
}
