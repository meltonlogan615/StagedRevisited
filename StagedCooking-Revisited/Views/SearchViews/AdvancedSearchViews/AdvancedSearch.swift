//
//  AdvancedSearch.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class AdvancedSearch: UIView {
  
  var scrollView = UIScrollView()
  var contentView = UIView()
  var detailsStack = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = K.primary
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
    print(String(describing: detailsStack.frame))
    NSLayoutConstraint.activate([
      detailsStack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 4),
      detailsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 4),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: detailsStack.trailingAnchor, multiplier: 4),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: detailsStack.bottomAnchor, multiplier: 2),
    ])
  }
}
