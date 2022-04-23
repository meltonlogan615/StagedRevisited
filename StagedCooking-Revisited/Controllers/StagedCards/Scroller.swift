//
//  Scroller.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/23/22.
//

import Foundation
import UIKit

class <#UIView Name#>: UIView {
  
  let scrollView = UIScrollView()
  let contentView = UIView()
  
  // may or may not be used depending on content
  var contentStackView = UIStackView()
  var contentArray = [String]()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension <#UIView Name#> {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    contentStackView.translatesAutoresizingMaskIntoConstraints = false
    contentStackView.axis = .vertical
    contentStackView.spacing = 8
    
  }
  
  func layout() {
    addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
    ])
    
    scrollView.addSubview(contentView)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    
    contentView.addSubview(contentStackView)
    NSLayoutConstraint.activate([
      contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
    ])
    
    for i in 0 ..< contentArray.count {
      let ingredientLine = UILabel()
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      contentStackView.addArrangedSubview(ingredientLine)
      ingredientLine.text = contentArray[i].capitalized
      ingredientLine.numberOfLines = 0
      ingredientLine.font = .systemFont(ofSize: 16)
    }
  }
}
