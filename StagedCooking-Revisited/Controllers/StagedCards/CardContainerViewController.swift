//
//  CardContainerViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/13/22.
//

import Foundation

import UIKit



protocol CardBuilder: AnyObject {
  func buildCards(ingredients: Ingredients, instructionsDictionary: [Int: String], ingredientDictionary: [Int: [String]]) -> [Card]
}

/// Acts as a holder for the StagedCardViewControllers
class StagedCardContainerViewController: UIViewController {
  
  // MARK: - PageViewController and Associates
  let pageViewController: UIPageViewController
  
  let getStarted = GetCookingViewController() //  Intro View
  let listView = IngredientListViewController()
  var cardVCs = [UIViewController]() // All Recipe Step Views
  var currentVC: UIViewController // Recipe StepView
  
  var cards = [Card]() //
  var recipe = Recipe()
  var ingredientList: Ingredients?
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    cardVCs.append(getStarted)
    cardVCs.append(listView)
    currentVC = cardVCs.first! // will always hold at least 1 card
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.scAccent
    getStarted.recipeLabel.text = recipe.title ?? ""
    getStarted.noOfSteps = cards.count
    getStarted.totalTime = recipe.readyInMinutes ?? 0
    listView.recipeName = recipe.title ?? ""
    listView.ingredients = ingredientList
    setUp()
  }
}

// MARK: - Setting Up/Styling View and LifeCylce
extension StagedCardContainerViewController {
  private func setUp() {
    guard let recipeName = recipe.title else { return }
    
    // Life Cycle, adding child VCs, all lines required
    for card in cards {
      let card = StagedCardViewController(recipeName: recipeName, cardCounter: card.id, ingredients: card.ingredients, instructions: card.instructions)
      cardVCs.append(card)
    }
    
    addChild(pageViewController)
    view.addSubview(pageViewController.view)
    pageViewController.didMove(toParent: self)
    
    pageViewController.dataSource = self
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
      view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
      view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
    ])
    
    pageViewController.setViewControllers([cardVCs.first!], direction: .forward, animated: false, completion: nil)
    currentVC = cardVCs.first!
  }
}

// MARK: - UIPageViewControllerDataSource
extension StagedCardContainerViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return getPreviousViewController(from: viewController)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return getNextViewController(from: viewController)
  }
  
  private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
    guard let index = cardVCs.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
    currentVC = cardVCs[index - 1]
    return cardVCs[index - 1]
  }
  
  private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
    guard let index = cardVCs.firstIndex(of: viewController), index + 1 < cardVCs.count else { return nil }
    currentVC = cardVCs[index + 1]
    return cardVCs[index + 1]
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return cardVCs.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return cardVCs.firstIndex(of: self.currentVC) ?? 0
  }
}



