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
  var selectedOptions = [String]()
  var switches = [Int: Bool]()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
    var tag = -1
    for option in Cuisine.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let label = LargeLabel()
      let optionText = "\(option.rawValue.localizedCapitalized)"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = optionText
      allOptions.append(optionText)
      
      let seg = IncludeExcludeSeg()
      seg.translatesAutoresizingMaskIntoConstraints = false
      seg.tag = tag
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.rowStack.addArrangedSubview(label)
      row.rowStack.addArrangedSubview(seg)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      tag -= 1
    }
  }
}

extension AdvancedSearch {
  func layoutDiets() {
    var rowTag = 1
    for option in Diet.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let label = LargeLabel()
      let optionText = "\(option.rawValue.localizedCapitalized)"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = optionText
      allOptions.append(optionText)
      
      let toggle = ToggleSwitch()
      toggle.translatesAutoresizingMaskIntoConstraints = false
      toggle.tag = rowTag
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.rowStack.addArrangedSubview(label)
      row.rowStack.addArrangedSubview(toggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 1
    }
  }
}

extension AdvancedSearch {
  func layoutIntolerances() {
    var rowTag = 1
    for option in Intolerances.allCases {
      let row = AdvancedSearchRow()
      
      let label = LargeLabel()
      let optionText = "\(option.rawValue.localizedCapitalized)"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = optionText
      allOptions.append(optionText)
      
      let toggle = ToggleSwitch()
      toggle.translatesAutoresizingMaskIntoConstraints = false
      toggle.tag = rowTag
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.rowStack.addArrangedSubview(label)
      row.rowStack.addArrangedSubview(toggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 1
    }
  }
}

extension AdvancedSearch {
  func layoutMealTypes() {
    var rowTag = 1
    for option in MealType.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let label = LargeLabel()
      let optionText = "\(option.rawValue.localizedCapitalized)"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = optionText
      allOptions.append(optionText)
      
      let toggle = ToggleSwitch()
      toggle.translatesAutoresizingMaskIntoConstraints = false
      toggle.tag = rowTag
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.rowStack.addArrangedSubview(label)
      row.rowStack.addArrangedSubview(toggle)
      
      detailsStack.addArrangedSubview(row)
      detailsStack.addArrangedSubview(divider)
      
      rowTag += 1
    }
  }
}
