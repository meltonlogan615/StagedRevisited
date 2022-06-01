//
//  Restrictions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/11/22.
//

import Foundation

/**
 Struct for information relating to  the `Recipe` itself.
 
 Previously, was used to hold data that would be passedinto the `GeneralModal`, but is no longer in use as that information is populated into the `RecipeView` itself.
 
 - May no longer be needed.
 */

struct GeneralInfo: Codable {
  var readyInMnutes: String
  var servings: String
  var dishType: String
  var cuisines: String
  var veryPopular: String
  var sustainable: String
}
