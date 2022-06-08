//
//  Response.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/7/22.
//

import Foundation

/**
 struct for the `Response` received from a successful  network call
 
`Number`
 - the total number of responses. Can be constrained either by was is available or by us.
 
 `Offset`
 - if pagination or infinite scroll are used, `offset` will be the value to update along with number to implement either
 */

struct Response: Decodable {
  var results: [SearchResult]?
  var baseUri: String?
  
  // these three props for pagination/scrolling
  var number: Int?
  var offset: Int?
  var totalResults: Int?
  
  var processingTimeMs: Int?
  var expires: Int?
  var isStale: Bool?
}
