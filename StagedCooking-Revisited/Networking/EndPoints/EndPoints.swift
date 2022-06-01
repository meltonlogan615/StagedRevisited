//
//  EndPoints.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation

/// struct EndPoints
/// For this purpose, has three basic properties: - baseURL, - searchType, - apiKey
struct EndPoints {
  private let baseURL = "https://api.spoonacular.com/recipes/"
  private var searchType = "complexSearch/"
  private let apiKey = APIKey.apiKey
  var recipeID: Int?
  var query: String?
  var filter: String?
}

/// Extension to build URL for Recipe Search. T
extension EndPoints {
  var endpointURL: URL {
    guard let query = query else { fatalError("Endpoint URL Failed") }
    let formattedQuery = query.replacingOccurrences(of: " ", with: "%20", options: .regularExpression, range: nil)
    let completedURL = URL(string: "\(baseURL)\(searchType)?apiKey=\(apiKey)&query=\(formattedQuery)&number=1&instructionsRequired=true&addRecipeNutrition=true")
    guard let url = completedURL else {
      preconditionFailure("Invalid URL: \(String(describing: completedURL))")
    }
    return url
  }
}

// Extension to build URL for Recipe Search with Advanced Search Filters Applied
extension EndPoints {
  var endpointForFilter: URL {
    guard let query = query else { fatalError("Query Endpoint Failed") }
    guard let filter = filter else { fatalError("Filter Endpoint URL Failed")}
    
    let formattedQuery = query.replacingOccurrences(of: " ", with: "%20", options: .regularExpression, range: nil)
    
    let completedURL = URL(string: "\(baseURL)\(searchType)?apiKey=\(apiKey)&query=\(formattedQuery)&number=1&instructionsRequired=true&addRecipeNutrition=true\(filter)")
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
    let idURL = URL(string: "\(baseURL)\(recipeID)/information?apiKey=\(apiKey)&includeNutrition=true")
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
  
// Filtered Search
  func getFilteredFood(for searched: String, with filter: String) -> EndPoints {
    return EndPoints(query: searched, filter: filter)
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
