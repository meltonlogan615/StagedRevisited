
//  UnwrapIngredients.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/19/22.
//
import Foundation
import UIKit
// TODO: - Later will be switch on settings based on ChefSettings for measurements
extension UIViewController {
  func unwrapMeasures(from ingredient: ExtendedIngredient) -> String {
    var line = String()
    var name = String()
    var measures = Measures()
    var us = Unit()
    var metric = Unit()
    var usAmount = Double()
    var usUnit = String()
    var metricAmount = Double()
    var metricUnit = String()
    
    if let safeName = ingredient.name {
      name = safeName
    }
    
    if let safeMeasures = ingredient.measures {
      measures = safeMeasures
    }
    
    if let safeUS = measures.us {
      us = safeUS
    }
    
    if let safeUSAmount = us.amount {
      usAmount = safeUSAmount
    }
    
    if let safeUSUnit = us.unitShort {
      usUnit = safeUSUnit
    }
    
    if let safeMetric = measures.metric {
      metric = safeMetric
    }
    
    if let safeMetricAmount = metric.amount {
      metricAmount = safeMetricAmount
    }
    
    if let safeMetricUnit = metric.unitShort {
      metricUnit = safeMetricUnit
    }
    
    let usFormat = "\(usAmount) \(usUnit)"
    let metricFormat = "\(metricAmount)\(metricUnit)"
    line = "\(usFormat) (\(metricFormat)) \(name)"
    
    return line
  }
}
