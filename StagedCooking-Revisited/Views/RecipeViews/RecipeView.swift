//
//  RecipeView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

import Foundation
import UIKit

// TODO: - #22 - Add a means to add Recipe to Favorites, use heart for not favorite & heart.fill for favorited

/**
 View to display recipe information.
 
 Modals are used to help reduce the amount of visual clutter that is presented.
 
 Buttons:
 - `showIngredientsButton` displays a list of all ingredients and their amounts.
 - `showSummaryButton` displays text information about the recipe.
 - `showNutritionButton` displays the nutritional information about the recipe.
 - `showRestrictionsButton` (aka Intolerances) displays whether or not the recipe can be classified as any of the default Intolerances.
 
 Also includes labels to display the most important informaton for a Chef considering if they should move forward with the recipe or not.
 
 If labels do not have a value, nothing will be displayed.
 */
class RecipeView: UIView {

  var scrollView = UIScrollView()
  var contentView = UIView()
  var stackView = UIStackView()

  var mainImage = UIImageView()
  var imageSize = CGSize.zero
  var saveButton = UIButton()
  var favoriteButton = UIButton()
  var titleLabel = UILabel()
  var dividerA = Divider()
  var infoStack = UIStackView()
  var dividerB = Divider()
  
  var showIngredientsButton = DetailsButton()
  var showSummaryButton = DetailsButton()
  var showNutritionButton = DetailsButton()
  var showRestrictionsButton = DetailsButton()
  
  var generalInfo: GeneralInfo?
  
  var readyInMinutesLabel = RecipeRowView()
  var servingsLabel = RecipeRowView()
  
  var dishTypeLabel = RecipeRowView()
  var cuisinesLabel = RecipeRowView()
  
  var veryPopularLabel = RecipeRowView()
  var sustainableLabel = RecipeRowView()
  
  var cheapLabel = RecipeRowView()
  var pricePerServingLabel = RecipeRowView()
  
  // Holders for Modal Property Values
  var summary = String()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    imageSize = CGSize(width: frame.width / 3, height: frame.width / 6)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Styling and Layout
extension RecipeView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 12
    
    mainImage.translatesAutoresizingMaskIntoConstraints = false
    mainImage.contentMode = .center
    mainImage.layer.cornerRadius = 8
    mainImage.clipsToBounds = true
    mainImage.frame.size = imageSize
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false
    saveButton.setImage(UIImage(systemName: "pin"), for: .normal)
    saveButton.setImage(UIImage(systemName: "pin.fill"), for: .selected)
    
    favoriteButton.translatesAutoresizingMaskIntoConstraints = false
    favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    titleLabel.numberOfLines = 0
    titleLabel.textAlignment = .center

    dividerA.translatesAutoresizingMaskIntoConstraints = false
    
    infoStack.translatesAutoresizingMaskIntoConstraints = false
    infoStack.axis = .vertical
    
    dividerB.translatesAutoresizingMaskIntoConstraints = false
    
    readyInMinutesLabel.translatesAutoresizingMaskIntoConstraints = false
    servingsLabel.translatesAutoresizingMaskIntoConstraints = false
    dishTypeLabel.translatesAutoresizingMaskIntoConstraints = false
    cuisinesLabel.translatesAutoresizingMaskIntoConstraints = false
    veryPopularLabel.translatesAutoresizingMaskIntoConstraints = false
    sustainableLabel.translatesAutoresizingMaskIntoConstraints = false
    cheapLabel.translatesAutoresizingMaskIntoConstraints = false
    pricePerServingLabel.translatesAutoresizingMaskIntoConstraints = false
    
    showIngredientsButton.translatesAutoresizingMaskIntoConstraints = false
    showIngredientsButton.setTitle("Ingredients", for: [])
    showIngredientsButton.setImage(UIImage(systemName: "list.bullet"), for: [])
    
    showSummaryButton.translatesAutoresizingMaskIntoConstraints = false
    showSummaryButton.setTitle("Summary", for: [])
    showSummaryButton.setImage(UIImage(systemName: "doc.text"), for: [])
    
    showNutritionButton.translatesAutoresizingMaskIntoConstraints = false
    showNutritionButton.setTitle("Nutrition", for: [])
    showNutritionButton.setImage(UIImage(systemName: "heart.circle"), for: [])

    showRestrictionsButton.translatesAutoresizingMaskIntoConstraints = false
    showRestrictionsButton.setTitle("Diets", for: [])
    showRestrictionsButton.setImage(UIImage(systemName: "exclamationmark.octagon"), for: [])
    
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

    contentView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ])

    stackView.addArrangedSubview(mainImage)
    mainImage.heightAnchor.constraint(equalToConstant: 168).isActive = true
    
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(dividerA)
    
    stackView.addArrangedSubview(infoStack)

    
    infoStack.addArrangedSubview(readyInMinutesLabel)
    infoStack.addArrangedSubview(servingsLabel)
    infoStack.addArrangedSubview(dishTypeLabel)
    infoStack.addArrangedSubview(cuisinesLabel)
    infoStack.addArrangedSubview(veryPopularLabel)
    infoStack.addArrangedSubview(sustainableLabel)
    infoStack.addArrangedSubview(cheapLabel)
    infoStack.addArrangedSubview(pricePerServingLabel)
    stackView.addArrangedSubview(dividerB)
    stackView.addArrangedSubview(showIngredientsButton)
    stackView.addArrangedSubview(showSummaryButton)
    stackView.addArrangedSubview(showNutritionButton)
    stackView.addArrangedSubview(showRestrictionsButton)
  }
}



