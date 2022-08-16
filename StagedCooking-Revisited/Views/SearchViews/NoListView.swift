//
//  NoListView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/21/22.
//

import Foundation
import UIKit

class NoListView: UIView {
  
  var noListLabel = UILabel()
  var viewName = String()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension NoListView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    noListLabel.translatesAutoresizingMaskIntoConstraints = false
    noListLabel.textColor = K.invertPrimary
    noListLabel.font = .preferredFont(forTextStyle: .title1)
  }
  
  func layout() {
    addSubview(noListLabel)
    NSLayoutConstraint.activate([
      noListLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      noListLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
