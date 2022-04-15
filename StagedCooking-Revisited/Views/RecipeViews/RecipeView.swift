//
//  RecipeHeader.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

class RecipeView: UIView {

  var image = UIImageView()
  var label = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension RecipeView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
//    image.translatesAutoresizingMaskIntoConstraints = false
    
    label.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
//    addSubview(image)
    
//    NSLayoutConstraint.activate([
//      image.topAnchor.constraint(equalTo: topAnchor),
//      image.trailingAnchor.constraint(equalTo: trailingAnchor),
//      image.bottomAnchor.constraint(equalTo: bottomAnchor),
//      image.leadingAnchor.constraint(equalTo: leadingAnchor)
//    ])
    
    addSubview(label)
    
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: centerXAnchor),
      label.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
    
  }
}
