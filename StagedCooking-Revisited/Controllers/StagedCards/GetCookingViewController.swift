//
//  GetCookingViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/14/22.
//

import Foundation
import UIKit

class GetCookingViewController: UIViewController {
  
  let getCookingStack = UIStackView()
  
  var recipeLabel = UILabel()

  let numberOfStepsLabel = UILabel()
  var noOfSteps = Int()
  
  let totalTimeLabel = UILabel()
  var totalTime = Int()
  
  let startLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "SC-Primary")
    style()
    layout()
  }
}

extension GetCookingViewController {
  
  func style() {
    getCookingStack.translatesAutoresizingMaskIntoConstraints = false
    getCookingStack.axis = .vertical
    getCookingStack.spacing = 24
    
    recipeLabel.translatesAutoresizingMaskIntoConstraints = false
    recipeLabel.font = .boldSystemFont(ofSize: 36)
    recipeLabel.textColor = UIColor(named: "SC-Primary-Reversed")
    recipeLabel.textAlignment = .center
    recipeLabel.numberOfLines = 0

    startLabel.translatesAutoresizingMaskIntoConstraints = false
    startLabel.font = .preferredFont(forTextStyle: .title1)
    startLabel.textColor = UIColor(named: "SC-Primary-Reversed")
    startLabel.textAlignment = .center
    startLabel.text = "Swipe Left To Get Started"
    
    numberOfStepsLabel.translatesAutoresizingMaskIntoConstraints = false
    numberOfStepsLabel.font = .preferredFont(forTextStyle: .title3)
    numberOfStepsLabel.textColor = UIColor(named: "SC-Primary-Reversed")
    numberOfStepsLabel.textAlignment = .center
    numberOfStepsLabel.text = "Number of Steps: \(noOfSteps)"

    totalTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    totalTimeLabel.textColor = UIColor(named: "SC-Primary-Reversed")
    totalTimeLabel.textAlignment = .center
    totalTimeLabel.font = .preferredFont(forTextStyle: .title3)
    totalTimeLabel.text = "Total Time: \(totalTime) minutes"

  }
  
  func layout() {
    getCookingStack.addArrangedSubview(recipeLabel)
    getCookingStack.addArrangedSubview(numberOfStepsLabel)
    getCookingStack.addArrangedSubview(totalTimeLabel)
    
    view.addSubview(getCookingStack)
    NSLayoutConstraint.activate([
      getCookingStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: getCookingStack.trailingAnchor, multiplier: 2),
      getCookingStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
    ])
    
    view.addSubview(startLabel)
    NSLayoutConstraint.activate([
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: startLabel.bottomAnchor, multiplier: 4),
      startLabel.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }
}
