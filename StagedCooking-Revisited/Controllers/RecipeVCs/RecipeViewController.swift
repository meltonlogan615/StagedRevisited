//
//  RecipeViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

//protocol CardBuilder {
//  func createCards()
//}

class RecipeViewController: UIViewController {
  
  let recipeView = RecipeView()
  let dataprovider = DataProvider()
  
  var recipe = Recipe()
  var extendedIngredients = [ExtendedIngredient]()
  var instructions = QTInstructions()
  var qtSteps = [QTStep]()
  var stepIngredients = [Int: [String]]()
  var stepInstructions = [Int: String]()
  var instructionsList = [String]()
  var recipeID = 658276 // replace with 0 once done testing
  var recipeImage = String()
  var recipeTitle = String()
  var ingredientList = [String]()
  
  var cards = [Card]()
  var cardData = [Int: [String: [String]]]()
  
  var startCookingButton = UIButton(type: .roundedRect)
  
  override func viewWillAppear(_ animated: Bool) {
    dataprovider.recipeID = recipeID
    loadRecipeByID(for: recipeID)
    getInstructions(for: recipeID)
    cardData = buildCardData(with: ingredientList, from: stepInstructions, using: stepIngredients)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = recipeTitle
    style()
    layout()
  }
}

extension RecipeViewController {
  
  func style() {
    recipeView.translatesAutoresizingMaskIntoConstraints = false
    recipeView.image.loadImage(url: recipeImage)
    
    startCookingButton.translatesAutoresizingMaskIntoConstraints = false
    startCookingButton.setTitle("Start Cooking", for: [])
    startCookingButton.addTarget(self, action: #selector(startCookingButtonTapped), for: .primaryActionTriggered)
  }
  
  func layout() {
    view.addSubview(recipeView)
    view.addSubview(startCookingButton)
    
    NSLayoutConstraint.activate([
      recipeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      recipeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      recipeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      recipeView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      startCookingButton.trailingAnchor.constraint(equalTo: recipeView.trailingAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: startCookingButton.bottomAnchor, multiplier: 5),
      startCookingButton.leadingAnchor.constraint(equalTo: recipeView.leadingAnchor)
    ])
  }
}

extension RecipeViewController: RecipeByID {
  func loadRecipeByID(for selectedRecipe: Int) {
    dataprovider.getRecipeByID(for: selectedRecipe) { [weak self] (foodResult: Result<Recipe, Error>) in
      guard let self = self else { return }
      switch foodResult {
        case .success(let model):
          DispatchQueue.main.async { [self] in
            guard let selectedRecipe = model as Recipe? else { return }
            self.recipe = selectedRecipe
            guard let extendedIngredients = selectedRecipe.extendedIngredients as [ExtendedIngredient]? else { return }
            self.extendedIngredients = extendedIngredients
//            print(self.extendedIngredients)
            
            // Images
//            guard let recipeImage = selectedRecipe.image else { return }
//            self.recipeImage = recipeImage
            
            // For use when looping for property dictionary
//            self.setValues(for: selectedRecipe)
//            ChefDefault.addToViewed(recipeDictionary: self.propertyDictionary)

            // For use when saving info
//            ChefDefault.saveChanges()
            
            self.unwrapRecipeProps()
            self.unwrapExtendedIngredients()
          }
        case .failure(let error):
          print("recipe error:", error)
      }
    }
  }
}

extension RecipeViewController {
  func getInstructions(for selectedsRecipe: Int) {
    dataprovider.getInstructionsByID(for: selectedsRecipe) { [weak self] (analyzed: Result<[QTInstructions], Error>) in
      guard let self = self else { return }
      switch analyzed {
        case .success(let model):
          guard let analyzedInstructions = model as [QTInstructions]? else { return }
          guard let deez = analyzedInstructions[0].steps as [QTStep]? else { return }
          self.unwrapSteps(deez)
//          print( "\nIngredients\n*****\n", self.stepIngredients, "\nInstructions\n*****\n", self.stepInstructions)
          //          self.instructions = analyzedInstructions
//          print(self.instructions)
          
        case .failure(let error):
          print("\nAnalyzed Error:\n", error)
      }
    }
  }
}

extension RecipeViewController {
  func buildCardData(with ingredients: [String], from instructions: [Int: String], using elements: [Int: [String]]) -> [Int: [String: [String]]]{
    var test = [Int: [String: [String]]]() // final result to return
    var cabinet = ingredients
    for (instKey, instValue) in instructions { // iterate through instructions dictionary
      var temp = [String: [String]]() // precurser to final
      var newHolder = [String]() // precurser to precuser
      
      for (inKey, inValue) in elements { // iterate through ingredients dictionary
        if instKey == inKey { // if keys match
          for i in 0 ..< inValue.count { // iterate through ingredientDictionary values array
            for j in 0 ..< cabinet.count { // iterate through ingredients array
              if cabinet[j].contains(inValue[i]) { // if value from ingredientDictionary is found in the ingredient string
                newHolder.append(cabinet[j]) // adds to stand alone array of string
                cabinet[j] = ""
              }
            }
          }
          temp[instValue] = newHolder // assigns newHolder to instruction key
        }
        test[instKey] = temp // assigns temp to instrcutions key
      }
    }
    print("Got here...")
    print(test)
    return test
  }
}

extension RecipeViewController {
  func unwrapRecipeProps() {
    if let title = recipe.title {
      self.recipeTitle = title
      recipeView.label.text = recipeTitle
    }
    
//    if let instruction = recipe.instructions {
//      self.instructionsList = breakUpInstructions(instruction)
//    }
  }
  
  private func unwrapExtendedIngredients() {
    for i in 0 ..< extendedIngredients.count {
      if let original = extendedIngredients[i].original {
        ingredientList.append(original)
      }
    }
    
//    print("Ingredients:\n", self.ingredientList)
//    print("Instructions:\n", self.instructionsList)
  }
  
  private func unwrapSteps(_ steps: [QTStep]) {
    var ingredientDict = [Int: [String]]()
    var instructionsDict = [Int: String]()
    for i in 0 ..< steps.count {
      var ingredientHolder = [String]()
      if let number = steps[i].number {
        if let ingredients = steps[i].ingredients as [Ent]? {
          for j in 0 ..< ingredients.count {
            guard let name = ingredients[j].name else { continue }
            ingredientHolder.append(name)
          }
          ingredientDict[number] = ingredientHolder
        }
        if let step = steps[i].step {
          instructionsDict[number] = step
        }
      }
    }
    self.stepIngredients = ingredientDict
    self.stepInstructions = instructionsDict
  }
}



extension RecipeViewController {
  @objc func startCookingButtonTapped(_ sender: UIButton) {
    let stagesVC = StagedCardContainerViewController()
    navigationController?.pushViewController(stagesVC, animated: true)
    print("tapped")
  }
}
