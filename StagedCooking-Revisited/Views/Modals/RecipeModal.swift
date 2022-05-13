//
//  RecipeModal.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/10/22.
//

import Foundation
import UIKit

class RecipeModal: UIView {
  
  var scrollView = UIScrollView()
  var contentView = UIView()
  var detailsStack = UIStackView()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor(named: "SC-Primary")
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension RecipeModal {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    detailsStack.translatesAutoresizingMaskIntoConstraints = false
    detailsStack.axis = .vertical
    detailsStack.spacing = 8
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
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    
    contentView.addSubview(detailsStack)
    NSLayoutConstraint.activate([
      detailsStack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: detailsStack.trailingAnchor, multiplier: 2),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: detailsStack.bottomAnchor, multiplier: 2),
      detailsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
    ])
  }
}
