//
//  AdvancedSearch.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

/**
 Super class for virtually all Advanced Options for Filters views.
 
 `allOptions` is an array of all of the associated enum.rawValue
 
 `switches` is a dictionary of it's index in list `Enum.allCases` and if it `isOn` or not
 */
class AdvancedSearch: UIView {
  
  var scrollView = UIScrollView()
  var contentView = UIView()
  var detailsStack = UIStackView()
  
  var allOptions = [String]()
  var switches = [Int: Bool]()

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    for (key, value) in switches {
      if value {
        print(key)
      }
    }
  }
}

extension AdvancedSearch {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    detailsStack.translatesAutoresizingMaskIntoConstraints = false
    detailsStack.axis = .vertical
    detailsStack.spacing = 12
  }
  
  func layout() {
    addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
    ])
    
    scrollView.addSubview(contentView)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
    ])
    
    contentView.addSubview(detailsStack)
    NSLayoutConstraint.activate([
      detailsStack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 4),
      detailsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 4),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: detailsStack.trailingAnchor, multiplier: 4),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: detailsStack.bottomAnchor, multiplier: 2),
    ])
  }
}

extension AdvancedSearch {
  func layoutCuisines() {
    var rowTag = 2
    for option in Cuisine.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let label = LargeLabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "\(option.rawValue.localizedCapitalized)"
      
      let toggle = IncludeExcludeSeg()
      toggle.translatesAutoresizingMaskIntoConstraints = false
      toggle.tag = rowTag
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.includeStack.addArrangedSubview(label)
      row.includeStack.addArrangedSubview(toggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 2
    }
  }
}

extension AdvancedSearch {
  func layoutDiets() {
    var rowTag = 2
    for option in Diet.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let rowLabel = LargeLabel()
      rowLabel.translatesAutoresizingMaskIntoConstraints = false
      rowLabel.text = option.rawValue.localizedCapitalized
      
      let excludeToggle = ToggleSwitch()
      excludeToggle.translatesAutoresizingMaskIntoConstraints = false
      excludeToggle.tag = rowTag
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.excludeStack.addArrangedSubview(rowLabel)
      row.excludeStack.addArrangedSubview(excludeToggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 2
    }
  }
}

extension AdvancedSearch {
  func layoutIntolerances() {
    var rowTag = 2
    for option in Intolerances.allCases {
      let row = AdvancedSearchRow()
      
      let rowLabel = LargeLabel()
      rowLabel.translatesAutoresizingMaskIntoConstraints = false
      rowLabel.text = option.rawValue.localizedCapitalized
      rowLabel.tag = rowTag
      
      let excludeToggle = ToggleSwitch()
      excludeToggle.translatesAutoresizingMaskIntoConstraints = false
      excludeToggle.tag = rowTag

      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.excludeStack.addArrangedSubview(rowLabel)
      row.excludeStack.addArrangedSubview(excludeToggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 2
    }
  }
}

extension AdvancedSearch {
func layoutMealTypes() {
    var rowTag = 2
    for option in MealType.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let includeLabel = LargeLabel()
      includeLabel.translatesAutoresizingMaskIntoConstraints = false
      includeLabel.text = option.rawValue.localizedCapitalized
      
      
      let includeToggle = ToggleSwitch()
      includeToggle.translatesAutoresizingMaskIntoConstraints = false
      includeToggle.tag = rowTag
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.includeStack.addArrangedSubview(includeLabel)
      row.includeStack.addArrangedSubview(includeToggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 2
    }
  }
}



