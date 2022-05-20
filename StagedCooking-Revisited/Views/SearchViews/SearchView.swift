//
//  SearchView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

class SearchView: UIView {
  
  let stackView = UIStackView()
  let searchTextField = CustomTextField()
  let searchButton = ActionButton()
  let advancedSearchButton = DetailsButton()
  
  let historyStack = UIStackView()
  let searchHistoryButton = TextOnlyButton()
  let viewedHistoryButton = TextOnlyButton()
  
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
    stackView.axis = .vertical
    stackView.spacing = 24
    stackView.distribution = .equalSpacing
    
    searchTextField.translatesAutoresizingMaskIntoConstraints = false
    searchTextField.placeholder = "Search"
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    searchButton.setTitle("Search", for: [])
    
    // MARK: - ChefDefaults Buttons
    // TODO: - Once it gets close to release time, bring these back into play
    advancedSearchButton.translatesAutoresizingMaskIntoConstraints = false
    advancedSearchButton.setTitle("Advanced Search", for: [])
    
    historyStack.translatesAutoresizingMaskIntoConstraints = false
    historyStack.axis = .horizontal
    historyStack.distribution = .fillEqually
    historyStack.spacing = 16

    searchHistoryButton.translatesAutoresizingMaskIntoConstraints = false
    searchHistoryButton.setTitle("Search History", for: [])
    searchHistoryButton.titleLabel?.adjustsFontSizeToFitWidth = true

    viewedHistoryButton.translatesAutoresizingMaskIntoConstraints = false
    viewedHistoryButton.setTitle("Viewed History", for: [])
    viewedHistoryButton.titleLabel?.adjustsFontSizeToFitWidth = true

    
    errorLabel.translatesAutoresizingMaskIntoConstraints = false
    errorLabel.numberOfLines = 0
    errorLabel.textColor = K.scAccent
    errorLabel.textAlignment = .center
    errorLabel.font = .systemFont(ofSize: 20, weight: .medium)
    errorLabel.layer.opacity = 0.0
    errorLabel.backgroundColor = K.primary
    errorLabel.layer.zPosition = 10
    errorLabel.layer.borderColor = K.scAccent?.cgColor
    errorLabel.layer.borderWidth = 2

    
    
  }
  
  func layout() {
    stackView.addArrangedSubview(searchTextField)
    stackView.addArrangedSubview(searchButton)
    
    // MARK: - ChefDefaults Added to view
    // TODO: - Once it gets close to release time, bring these back into play
    // TODO: - Will also neewd to apply constraints
    stackView.addArrangedSubview(advancedSearchButton)
    historyStack.addArrangedSubview(searchHistoryButton)
    historyStack.addArrangedSubview(viewedHistoryButton)
    stackView.addArrangedSubview(historyStack)
    
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
    
    addSubview(errorLabel)
    NSLayoutConstraint.activate([
      errorLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
      errorLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
    ])
  }
}

// MARK: - UITextFieldDelegate
//extension SearchView: UITextFieldDelegate {
//  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//    return true
//  }
//
//  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//    return true
//  }
//
//  func textFieldDidEndEditing(_ textField: UITextField) {
//  }
//}

