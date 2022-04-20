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
  let recipeLabel = UILabel()
  let startLabel = UILabel()
  let numberOfStepsLabel = UILabel()
  let totalTimeLabel = UILabel()
  
  let noOfSteps = 5 // when completed replace static value with initialized Int
  let totalTime = 20 // when completed replace static value with initalized Int
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
    recipeLabel.textAlignment = .center
    recipeLabel.font = .boldSystemFont(ofSize: 36)
    recipeLabel.text = "Recipe Name"
    recipeLabel.textColor = UIColor(named: "SC-Green")

    startLabel.translatesAutoresizingMaskIntoConstraints = false
    startLabel.textAlignment = .center
    startLabel.font = .preferredFont(forTextStyle: .title1)
    startLabel.text = "Swipe Left To Get Started"
    
    numberOfStepsLabel.translatesAutoresizingMaskIntoConstraints = false
    numberOfStepsLabel.textAlignment = .center
    numberOfStepsLabel.font = .preferredFont(forTextStyle: .title3)
    numberOfStepsLabel.text = "Number of Steps: \(noOfSteps)"

    totalTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    totalTimeLabel.textAlignment = .center
    totalTimeLabel.font = .preferredFont(forTextStyle: .title3)
    totalTimeLabel.text = "Total Time: \(totalTime)"

  }
  
  func layout() {
    getCookingStack.addArrangedSubview(recipeLabel)
    getCookingStack.addArrangedSubview(numberOfStepsLabel)
    getCookingStack.addArrangedSubview(totalTimeLabel)
    
    view.addSubview(getCookingStack)
    NSLayoutConstraint.activate([
      getCookingStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      getCookingStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    view.addSubview(startLabel)
    NSLayoutConstraint.activate([
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: startLabel.bottomAnchor, multiplier: 4),
      startLabel.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }
}
