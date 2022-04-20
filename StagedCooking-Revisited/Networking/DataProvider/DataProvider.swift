//
//  DataProvider.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit


class DataProvider  {
  
  private let networkDataFlow = NetworkDataFlow()
  private let endpoints = EndPoints()
    
  func getRecipes<T: Decodable>(for query: String?, completion: @escaping (Result<T, Error>) -> Void) {
    if let query = query {
      let recipeEndpoint = endpoints.getFood(for: query)
      networkDataFlow.getData(for: recipeEndpoint.endpointURL) { (result: Result<T, Error>) in
        completion(result)
      }
    }
  }
  
  func getRecipeByID<T: Decodable>(for recipeID: Int?, completion: @escaping (Result<T, Error>) -> Void) {
    if let recipeID = recipeID {
      let recipeByIDEndpoint = endpoints.getRecipeByID(for: recipeID)
      networkDataFlow.getData(for: recipeByIDEndpoint.endpointForID)  { (result: Result<T, Error>) in
        completion(result)
      }
    }
  }
  
  func getInstructionsByID<T: Decodable>(for recipeID: Int?, completion: @escaping (Result<T, Error>) -> Void) {
    if let recipeID = recipeID {
      let instructionsEndpoint = endpoints.getInstructions(forID: recipeID)
      networkDataFlow.getData(for: instructionsEndpoint.endpointForInstructions) { (result: Result<T, Error>) in
        completion(result)
      }
    }
  }
}

// Later, if additional endpoints or API provided functionality added, will ned to add additional func to recive the data that will be passed back in.
