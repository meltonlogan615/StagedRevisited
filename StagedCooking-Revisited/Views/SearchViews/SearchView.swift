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
//  let advancedSearchButton = ActionButton()
  let errorLabel = UILabel()
  
//  let historyStack = UIStackView()
//  let searchHistoryButton = UIButton(type: .system)
//  let viewedHistoryButton = UIButton(type: .system)
  
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
    stackView.spacing = 16
    stackView.distribution = .equalSpacing
    
    searchTextField.translatesAutoresizingMaskIntoConstraints = false
    searchTextField.placeholder = "Search"
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    searchButton.setTitle("Search", for: [])
    
//    advancedSearchButton.translatesAutoresizingMaskIntoConstraints = false
//    advancedSearchButton.setTitle("Advanced Search", for: [])
    
//    historyStack.translatesAutoresizingMaskIntoConstraints = false
//    historyStack.axis = .horizontal
//    historyStack.distribution = .fillEqually
//
//    searchHistoryButton.translatesAutoresizingMaskIntoConstraints = false
//    searchHistoryButton.setTitle("Show Search History", for: [])
//
//    viewedHistoryButton.translatesAutoresizingMaskIntoConstraints = false
//    viewedHistoryButton.setTitle("Show Viewed History", for: [])
    
    errorLabel.translatesAutoresizingMaskIntoConstraints = false
    errorLabel.numberOfLines = 0
    errorLabel.textColor = .systemRed
    errorLabel.textAlignment = .center
    errorLabel.isHidden = true
  }
  
  func layout() {
    stackView.addArrangedSubview(searchTextField)
    stackView.addArrangedSubview(searchButton)
//    stackView.addArrangedSubview(advancedSearchButton)
    
//    historyStack.addArrangedSubview(searchHistoryButton)
//    historyStack.addArrangedSubview(viewedHistoryButton)
//    stackView.addArrangedSubview(historyStack)
    
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
    
    addSubview(errorLabel)
    NSLayoutConstraint.activate([
      errorLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
      errorLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
    ])
  }
}

// MARK: - UITextFieldDelegate
extension SearchView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchTextField.endEditing(true)
    searchTextField.resignFirstResponder()
    return true
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
  }
}
