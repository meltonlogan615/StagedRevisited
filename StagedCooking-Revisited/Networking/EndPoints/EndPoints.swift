//
//  EndPoints.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
struct EndPoints {
  private let baseURL = "https://api.spoonacular.com/recipes/"
  private var searchType = "complexSearch/"
  private let apiKey = APIKey.apiKey
  var recipeID: Int?
  var query: String?
}

// Extension to build URL for Recipe Search
// TODO: - Currently, can only search for single word, need to resolve how to deal with strings containing an empty space
extension EndPoints {
  var endpointURL: URL {
    guard let query = query else { fatalError("Endpoint URL Failed") }
    let formattedQuery = query.replacingOccurrences(of: " ", with: "%20", options: .regularExpression, range: nil)
    let completedURL = URL(string: "\(baseURL)\(searchType)?apiKey=\(apiKey)&query=\(formattedQuery)&number=900&instructionsRequired=true")
    guard let url = completedURL else {
      preconditionFailure("Invalid URL: \(String(describing: completedURL))")
    }
    return url
  }
}

// Extension to build URL for Showing Recipe by ID
extension EndPoints {
  var endpointForID: URL {
    guard let recipeID = recipeID else { fatalError("Endpoint for ID Failed") }
    let idURL = URL(string: "\(baseURL)\(recipeID)/information?apiKey=\(apiKey)&includeNutrition=false")
    guard let idURL = idURL else {
      preconditionFailure("Invalid URL: \(String(describing: idURL))")
    }
    return idURL
  }
}
// Extension to build URL for Anylized Instructions
extension EndPoints {
  var endpointForInstructions: URL {
    guard let recipeID = recipeID else { fatalError("Endpoint for ID Failed") }
    let instructionsURL = URL(string: "\(baseURL)\(recipeID)/analyzedInstructions?apiKey=\(apiKey)")
    guard let instructionsURL = instructionsURL else {
      preconditionFailure("Invalid URL: \(String(describing: instructionsURL))")
    }
    return instructionsURL
  }
}

extension EndPoints {
// Search
  func getFood(for searched: String) -> EndPoints {
    return EndPoints(query: searched)
  }
  
// Recipe Details by ID
  func getRecipeByID(for recipeID: Int) -> EndPoints {
    return EndPoints(recipeID: recipeID)
  }
  
// Analyzed Instructions
  func getInstructions(forID recipeID: Int) -> EndPoints {
    return EndPoints(recipeID: recipeID)
  }
  
}

// Later, if additional endpoints or API provided functionality added, w will ned to futher extend EndPoints to generate the url & create the static func to recive the data that will be passed back in.
