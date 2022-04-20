//
//  CardContainerViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/13/22.
//

import Foundation

import UIKit

protocol CardBuilder: AnyObject {
  func buildCards(ingredients: [String], instructionsDictionary: [Int: String], ingredientDictionary: [Int: [String]]) -> [Card]
}

class StagedCardContainerViewController: UIViewController {
  let getStarted = GetCookingViewController()
  var cards = [Card]()
//  var stagedCards = [SafeCard]()
  
  let pageViewController: UIPageViewController
  var cardVCs = [UIViewController]()
  var currentVC: UIViewController
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    let placeholder = getStarted
    cardVCs.append(placeholder)
    
    currentVC = cardVCs.first!
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)


  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUp()
  }
}

// MARK: - Setting Up/Styling View and LifeCylce
extension StagedCardContainerViewController {
  private func setUp() {
    view.backgroundColor = UIColor(named: "SC-Orange")
    
    // Life Cycle, adding child VCs, all lines required
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


// MARK: - Taking the Dictionary Data and creating Cards with Optional Properties
//  Will now be a method called in RecipeViewController which will then pass the reference to [Card] to StagedCardViewController.
//
//extension StagedCardContainerViewController {
//  func createCards(from cardData: [Int: [String: [String]]]) -> [Card] {
//    var cards = [Card]()
//    let sortedCards = cardData.sorted(by: { $0.0 < $1.0 })
//    for (key, _) in sortedCards {
//      let cardNumber = key
//      var cardIngredients = [String]()
//      var cardInstructions = String()
//      if let stepInstructions = cardData[key] {
//        for (stepKey, stepValue) in stepInstructions {
//          cardInstructions = stepKey
//          if stepValue.isEmpty {
//            cardIngredients = [""]
//          } else {
//            cardIngredients = stepValue
//          }
//          let card = Card(id: cardNumber, ingredients: cardIngredients, instructions: cardInstructions)
//          cards.append(card)
//        }
//      }
//      cards = cards.sorted()
//    }
//    return cards
//  }
//}

// MARK: - Unwrapping Array of Cards with optional Properties and returning an Array of Cards with unwrapped Properties
//  With the revision of creating [Card] in the RecipeViewController, there will be no need to unwrap each property value.
//
//extension StagedCardContainerViewContrr
//    let pantry = cards
//    for i in 0 ..< pantry.count {
//      if let number = pantry[i].number {
//        unwrappedNumber = number
//      }
//      if let ingredients = pantry[i].ingredients {
//        unwrappedIngredients = ingredients
//      }
//      if let instructions = pantry[i].instructions {
//        unwrappedInstructions = instructions
//      }
//      let stagedCard = SafeCard(id: unwrappedNumber, ingredients: unwrappedIngredients, instructions: unwrappedInstructions)
//      superDuper.append(stagedCard)
//    }
//    //  print(superDuper)
//    return superDuper
//  }
//}


