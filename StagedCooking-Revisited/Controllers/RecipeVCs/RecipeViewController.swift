//
//  RecipeViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

class RecipeViewController: UIViewController {
  
  let recipeView = RecipeView()
  let dataprovider = DataProvider()
  let test = TempData()
  
  var steps = [Step]()
  
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
  var recipeImage = String()
  var recipeTitle = String()
  
  var cards = [Card]()
  
  var startCookingButton = UIButton(type: .roundedRect)
  
  override func viewWillAppear(_ animated: Bool) {
//    loadRecipeByID(for: recipeID) // Gets the Data for the Recipe. Also generates data for ingredientList
//    getInstructions(for: recipeID) // Generates stepIngredients & stepInstructions
//    recipeView.label.text = recipeTitle
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Hot Chicken"
    view.backgroundColor = .red
    style()
    layout()
  }
}

extension RecipeViewController {
  
  func style() {
    recipeView.translatesAutoresizingMaskIntoConstraints = false
//    recipeView.image.loadImage(url: recipeImage)
    
    /*
    startCookingButton.translatesAutoresizingMaskIntoConstraints = false
    startCookingButton.setTitle("Start Cooking", for: [])
    startCookingButton.addTarget(self, action: #selector(startCookingButtonTapped), for: .primaryActionTriggered)
     */
  }
  
  func layout() {
    view.addSubview(recipeView)
//    view.addSubview(startCookingButton)
    
    NSLayoutConstraint.activate([
      recipeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      recipeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      recipeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      recipeView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    ])
    
    recipeView.image.frame.size = CGSize(width: 50, height: 50)
    
//    NSLayoutConstraint.activate([
//      startCookingButton.trailingAnchor.constraint(equalTo: recipeView.trailingAnchor),
//      view.bottomAnchor.constraint(equalToSystemSpacingBelow: startCookingButton.bottomAnchor, multiplier: 5),
//      startCookingButton.leadingAnchor.constraint(equalTo: recipeView.leadingAnchor)
//    ])
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
            self.recipe = selectedRecipe
            
            guard let title = self.recipe.title else { return }
            
            self.title = title
            self.recipeTitle = title
            
            // MARK: - Ingredients Array - `ingredientList`
            guard let extendedIngredients = selectedRecipe.extendedIngredients as [ExtendedIngredient]? else { return }
            for i in 0 ..< extendedIngredients.count {
              guard let original = extendedIngredients[i].original else { return }
              self.ingredientList.append(original)
            }
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
    print(ingredientDictionary)
    print(instructionsDictionary)
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
//              else {
//                continue
//              }
              
            }
          }
          print("Card Number:", cardNumber)
          print("Ingredients:", mixingBowl)
          print("Instructions:", instructionsValue, "\n")
          
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
  @objc func startCookingButtonTapped(_ sender: UIButton) {
    let stagesVC = StagedCardContainerViewController()
    let cards = buildCards(ingredients: ingredientList, instructionsDictionary: stepInstructions, ingredientDictionary: stepIngredients)
    stagesVC.cards = cards
    print(cards.count)
    navigationController?.pushViewController(stagesVC, animated: true)
    print("tapped")
  }
}
