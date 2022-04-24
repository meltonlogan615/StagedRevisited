//
//  RecipeViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

class RecipeViewController: UIViewController {

  let dataprovider = DataProvider()
  
  var steps = [Step]()
  var cards = [Card]()
  
  // View Elements
  let scrollView = UIScrollView()
  let recipeView = UIView()
  var recipeStack = UIStackView()
  
  var recipeImageView = UIImageView()
  var recipeImage = String()
  var recipeImageSize = CGFloat()
  
  let recipeTitleLabel = UILabel()
  var recipeTitle = String()
  var summaryLabel = UILabel()
  
  var startCookingButton = UIButton()
  

  
  // Instructions
  var instructions = Instructions()
  var instructionsList = [String]()
  var stepInstructions = [Int: String]()
  
  // Ingredients
  var extendedIngredients = [ExtendedIngredient]()
  var ingredientList = [String]()
  var stepIngredients = [Int: [String]]()
  
  // Recipe
  var recipe = Recipe()
  var recipeID = 0
  
  override func viewWillAppear(_ animated: Bool) {
    loadRecipeByID(for: recipeID) // Gets the Data for the Recipe. Also generates data for ingredientList
    getInstructions(for: recipeID) // Generates stepIngredients & stepInstructions
    style()
    layout()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    recipeImageSize = (view.frame.size.height / 5)
  }
}

extension RecipeViewController {
  
  func style() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    
    recipeView.translatesAutoresizingMaskIntoConstraints = false
    
    recipeStack.translatesAutoresizingMaskIntoConstraints = false
    recipeStack.axis = .vertical
    recipeStack.spacing = 12
    
    recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    recipeTitleLabel.numberOfLines = 0
    recipeTitleLabel.font = .preferredFont(forTextStyle: .title2)
    recipeTitleLabel.textAlignment = .center
    recipeTitleLabel.text = recipeTitle
    
    recipeImageView.translatesAutoresizingMaskIntoConstraints = false
    recipeImageView.contentMode = .scaleAspectFit
    recipeImageView.layer.cornerRadius = 16
    recipeImageView.clipsToBounds = true
    
    summaryLabel.translatesAutoresizingMaskIntoConstraints = false
    summaryLabel.numberOfLines = 0
    summaryLabel.font = .systemFont(ofSize: 20)
    summaryLabel.adjustsFontSizeToFitWidth = true
    summaryLabel.textAlignment = .justified
    
    startCookingButton.translatesAutoresizingMaskIntoConstraints = false
    startCookingButton.setTitle("Start Cooking", for: .normal)
    startCookingButton.backgroundColor = .link
    startCookingButton.addTarget(self, action: #selector(startCookingButtonTapped), for: .primaryActionTriggered)
  }
  
  func layout() {
    view.addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    ])
    
    scrollView.addSubview(recipeView)
    NSLayoutConstraint.activate([
      recipeView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      recipeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      recipeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      recipeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      recipeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    
    recipeView.addSubview(recipeStack)
    NSLayoutConstraint.activate([
      recipeStack.topAnchor.constraint(equalToSystemSpacingBelow: recipeView.topAnchor, multiplier: 2),
      recipeView.trailingAnchor.constraint(equalToSystemSpacingAfter: recipeStack.trailingAnchor, multiplier: 4),
      recipeView.bottomAnchor.constraint(equalToSystemSpacingBelow: recipeStack.bottomAnchor, multiplier: 2),
      recipeStack.leadingAnchor.constraint(equalToSystemSpacingAfter: recipeView.leadingAnchor, multiplier: 4)
    ])
    
    
    recipeStack.addArrangedSubview(recipeImageView)
    NSLayoutConstraint.activate([
      recipeImageView.heightAnchor.constraint(equalToConstant: recipeImageSize),
    ])
    
    recipeStack.addArrangedSubview(recipeTitleLabel)
    
//    for i in 0 ..< ingredientList.count {
//      let ingredientLine = UILabel()
//      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
//      recipeStack.addArrangedSubview(ingredientLine)
//      ingredientLine.text = ingredientList[i].capitalized
//      ingredientLine.numberOfLines = 0
//      ingredientLine.font = .systemFont(ofSize: 16)
//    }
    
    recipeStack.addArrangedSubview(summaryLabel)
    
    recipeStack.addArrangedSubview(startCookingButton)
  }
}

// MARK: - loadRecipe Method - Get Recipe Information and create an array from Recipe.extendedIngrediets property
extension RecipeViewController: RecipeByID {
  func loadRecipeByID(for selectedRecipe: Int) {
    dataprovider.getRecipeByID(for: selectedRecipe) { [weak self] (foodResult: Result<Recipe, Error>) in
      guard let self = self else { return }
      switch foodResult {
        case .success(let model):
          DispatchQueue.main.async { [self] in
            guard let selectedRecipe = model as Recipe? else { return }
            self.setProperties(for: selectedRecipe)
            
            // MARK: - Ingredients Array - `ingredientList`

          }
        case .failure(let error):
          print("recipe error:", error)
      } // End of Switch
    }
  }
}

// MARK: - Get the instructions and create a dictionary [Step.Number(Int): Step.StepInstructions(String)]
extension RecipeViewController {
  func getInstructions(for selectedsRecipe: Int) {
    dataprovider.getInstructionsByID(for: selectedsRecipe) { [weak self] (analyzedInstructions: Result<[Instructions], Error>) in
      guard let self = self else { return }
      switch analyzedInstructions {
        case .success(let model):
          
          guard let analyzedInstructions = model as [Instructions]? else { return }
          guard let recipeSteps = analyzedInstructions[0].steps as [Step]? else { return }
          
          let sortedSteps = recipeSteps.sorted()
          for stepNumber in 0 ..< sortedSteps.count {
            
            // MARK: - Instructions Dictionary - `stepInstructions` - WORKS GREAT
            if let number = sortedSteps[stepNumber].number {
              if let step = sortedSteps[stepNumber].step {
                self.stepInstructions[number] = step
              }
              
              // MARK: - Ingredients Dictionary - `stepIngredients` - ERROR PRONE
              guard let analyzedIngredients = sortedSteps[stepNumber].ingredients as [StepIngredient]? else { return }
              var shortIngredients = [String]()
              for i in 0 ..< analyzedIngredients.count {
                guard let shortName = analyzedIngredients[i].name else { return }
                if analyzedIngredients.isEmpty {
                  continue
                } else {
                  shortIngredients.append(shortName)
                }
              }
              self.stepIngredients[number] = shortIngredients
            } // end of number loop
          }// end of step loop
        case .failure(let error):
          print("\nAnalyzed Error:\n", error)
          
      }
    }
  }
  // END of Extension
}


// MARK: - Building Cards for StagedCards
extension RecipeViewController: CardBuilder {
  func buildCards(ingredients: [String], instructionsDictionary: [Int: String], ingredientDictionary: [Int: [String]]) -> [Card]{
//    print(ingredientDictionary)
//    print(instructionsDictionary)
    var cards = [Card]()
    let sortedInstructions = instructionsDictionary.sorted(by: { $0.key < $1.key } )
    let sortedIngredients = ingredientDictionary.sorted(by: { $0.key < $1.key } )
    var cabinet = ingredients // need mutable [String]
    
    var cardNumber = 0
    
    // iterate through instructions dictionary
    for (instructionsKey, instructionsValue) in sortedInstructions {
      
      cardNumber = instructionsKey
      
      // iterate through ingredients dictionary
      for (ingredientKey, ingredientValue) in sortedIngredients {
        
        // if keys match
        if instructionsKey == ingredientKey {
          var mixingBowl = [String]()
          // iterate through ingredientDictionary values array
          for i in 0 ..< ingredientValue.count {
            
            // iterate through ingredients array
            for j in 0 ..< cabinet.count {
              
              // if value from ingredientDictionary is found in the ingredient string
              if cabinet[j].contains(ingredientValue[i]) {
                mixingBowl.append(cabinet[j])
                cabinet[j] = ""
              }
              
            }
          }          
          let card = Card(id: cardNumber, ingredients: mixingBowl, instructions: instructionsValue)
          cards.append(card)
        }
      }
    }
    cards = cards.sorted()
    return cards
  }
}

extension RecipeViewController {
  func setProperties(for selectedRecipe: Recipe) {
    self.recipe = selectedRecipe
    
    guard let title = selectedRecipe.title else { return }
    self.recipeTitle = title
    
    guard let image = selectedRecipe.image else { return }
//    self.recipeImage = image
    self.recipeImageView.loadImage(url: image)
    
    guard let summery = self.recipe.summary else { return }
    let formattedSummery = summery.replacingOccurrences(of: "<[^>]+>", with: " ", options: .regularExpression, range: nil)
    self.summaryLabel.text = formattedSummery
    
    guard let extendedIngredients = selectedRecipe.extendedIngredients as [ExtendedIngredient]? else { return }
    for i in 0 ..< extendedIngredients.count {
      guard let original = extendedIngredients[i].original else { return }
      self.ingredientList.append(original)
    }
  }
}

extension RecipeViewController {
  @objc func startCookingButtonTapped(_ sender: UIButton) {
    print("tapped")
    let stagesVC = StagedCardContainerViewController()
    let cards = buildCards(ingredients: ingredientList, instructionsDictionary: stepInstructions, ingredientDictionary: stepIngredients)
    stagesVC.recipe = recipe
    stagesVC.cards = cards
    navigationController?.pushViewController(stagesVC, animated: true)
  }
}
