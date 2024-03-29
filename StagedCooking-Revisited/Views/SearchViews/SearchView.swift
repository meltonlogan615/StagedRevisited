//
//  SearchView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

// TODO: - Need to find best option for SavedRecipes & FavoriteRecipes

/**
 Primary Starting Point for the app.
 
 Buttons:
 - `searchButton` triggers the networking call to generate data for `RecipeListCollectionView`
 - `advancedSearchButton` opens to `AdvancedSearchViewController`
 */
class SearchView: UIView {
  
  let stackView = UIStackView()
  let searchTextField = LargeTextField(placeholder: "Search")
  let searchButton = ActionButton()
  let advancedSearchButton = DetailsButton()
  
  let errorLabel = UILabel()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension SearchView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.spacing = 0
    
    searchTextField.translatesAutoresizingMaskIntoConstraints = false
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: [])
    searchButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
//    searchButton.setTitle("Search", for: [])
    
    // TODO: - Once it gets close to release time, bring these back into play
    advancedSearchButton.translatesAutoresizingMaskIntoConstraints = false
    advancedSearchButton.setTitle("Advanced Search", for: [])
    
    errorLabel.translatesAutoresizingMaskIntoConstraints = false
    errorLabel.numberOfLines = 0
    errorLabel.textColor = K.scAccent
    errorLabel.textAlignment = .center
    errorLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    errorLabel.layer.opacity = 0.0
    errorLabel.backgroundColor = K.primary
    errorLabel.layer.zPosition = 10
  }
  
  func layout() {
    stackView.addArrangedSubview(searchTextField)
    stackView.addArrangedSubview(searchButton)
    
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
    
    addSubview(errorLabel)
    NSLayoutConstraint.activate([
      errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
      errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      errorLabel.widthAnchor.constraint(equalTo: widthAnchor),
    ])
    
  }
}

