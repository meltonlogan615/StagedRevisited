//
//  MacrosViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/20/22.
//

import Foundation
import UIKit

protocol FilteredSearch: AnyObject {
  func filterRecipes(for recipe: String, with options: String)
}

class MacrosViewController: UIViewController {
  
  let dataprovider = DataProvider()
  
  var viewTitle = String()

  let optionLabel = UILabel()
  let segController = UISegmentedControl(items: ["Minimum", "Maximum"])
  let macroPicker = UIPickerView()
  
  let textField = LargeTextField()
  let confirmButton = ActionButton()
  
  let options = MacrosForSpin.allCases
  var selection = String()
  var addedOptionsForTable = [String]()
  var addedOptionsForSearch = [String]()
  let table = UITableView()
  var searchedRecipe = String()
  
  let saveButton = ActionButton()
  
  var additionalFilters = String()
  
  var sourceView = UIViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    viewTitle = "Macronutrients"
    optionLabel.addKerning(to: viewTitle.capitalized)
    view.backgroundColor = K.primary
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    table.dataSource = self
    macroPicker.dataSource = self
    macroPicker.delegate = self
    style()
    layout()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    print(addedOptionsForSearch)
  }

}

extension MacrosViewController {
  
  func style() {
    optionLabel.translatesAutoresizingMaskIntoConstraints = false
    optionLabel.font = .preferredFont(forTextStyle: .largeTitle)
    optionLabel.textColor = K.invertPrimary
    optionLabel.textAlignment = .center
    optionLabel.text = viewTitle
    
    macroPicker.translatesAutoresizingMaskIntoConstraints = false
    
    segController.translatesAutoresizingMaskIntoConstraints = false
    segController.tintColor = UIColor.white
    segController.selectedSegmentTintColor = K.modalBG
    segController.backgroundColor = K.scGreen
    segController.selectedSegmentIndex = 0
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.textAlignment = .center
    textField.placeholder = "Amount"
    
    confirmButton.translatesAutoresizingMaskIntoConstraints = false
    confirmButton.setTitle("Confrim", for: [])
    confirmButton.backgroundColor = .cyan
    confirmButton.addTarget(self, action: #selector(addOptions), for: .primaryActionTriggered)
    
    table.translatesAutoresizingMaskIntoConstraints = false
    table.dataSource = self
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    table.backgroundColor = .clear
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false
    saveButton.setTitle("Save", for: [])
    saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .primaryActionTriggered)

  }
  
  func layout() {
    view.addSubview(optionLabel)
    NSLayoutConstraint.activate([
      optionLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      optionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: optionLabel.trailingAnchor, multiplier: 4),
    ])
    
    view.addSubview(macroPicker)
    NSLayoutConstraint.activate([
      macroPicker.topAnchor.constraint(equalToSystemSpacingBelow: optionLabel.bottomAnchor, multiplier: 1),
      macroPicker.leadingAnchor.constraint(equalTo: optionLabel.leadingAnchor),
      macroPicker.trailingAnchor.constraint(equalTo: optionLabel.trailingAnchor),
    ])
    
    view.addSubview(segController)
    NSLayoutConstraint.activate([
      segController.topAnchor.constraint(equalTo: macroPicker.bottomAnchor),
      segController.leadingAnchor.constraint(equalTo: optionLabel.leadingAnchor),
      segController.trailingAnchor.constraint(equalTo: optionLabel.trailingAnchor),
    ])
    
    view.addSubview(textField)
    NSLayoutConstraint.activate([
      textField.topAnchor.constraint(equalToSystemSpacingBelow: segController.bottomAnchor, multiplier: 2),
      textField.leadingAnchor.constraint(equalTo: segController.leadingAnchor),
      textField.trailingAnchor.constraint(equalTo: segController.trailingAnchor),
      
    ])
    
    view.addSubview(confirmButton)
    NSLayoutConstraint.activate([
      confirmButton.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 2),
      confirmButton.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
      confirmButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
    ])
    
    view.addSubview(table)
    NSLayoutConstraint.activate([
      table.topAnchor.constraint(equalToSystemSpacingBelow: confirmButton.bottomAnchor, multiplier: 2),
      table.leadingAnchor.constraint(equalTo: confirmButton.leadingAnchor),
      table.trailingAnchor.constraint(equalTo: confirmButton.trailingAnchor),
    ])
    
    view.addSubview(saveButton)
    NSLayoutConstraint.activate([
      saveButton.topAnchor.constraint(equalToSystemSpacingBelow: table.bottomAnchor, multiplier: 2),
      saveButton.leadingAnchor.constraint(equalTo: confirmButton.leadingAnchor),
      saveButton.trailingAnchor.constraint(equalTo: confirmButton.trailingAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: saveButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6)
    ])
  }
}

extension MacrosViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return options.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return options[row].rawValue
  }


  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selection = options[row].rawValue
  }
}

extension MacrosViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return addedOptionsForTable.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    config.text = addedOptionsForTable[indexPath.row]
    cell.contentConfiguration = config
    cell.backgroundColor = .clear
    return cell
  }
}

extension MacrosViewController {
  @objc func addOptions() {
    if selection == MacrosForSpin.SelectMacro.rawValue { return } else {
      guard let amount = textField.text else { return }
      if amount == "" {
        return
      }
      switch segController.selectedSegmentIndex {
        case 0:
          addedOptionsForSearch.append("min\(selection)=\(amount)")
          addedOptionsForTable.append("Minimum \(selection): \(amount)")
        case 1:
          addedOptionsForSearch.append("max\(selection)=\(amount)")
          addedOptionsForTable.append("Maximum \(selection): \(amount)")
        default:
          break
      }
      textField.text = ""
      table.reloadData()
    }
  }
  
  @objc func saveButtonTapped() {
//    let filteredList = RecipeListCollectionView()
//    for option in addedOptionsForSearch {
//      additionalFilters += "&\(option)"
//    }
//    filteredList.additionalFilters = self.additionalFilters
//    filteredList.filterRecipes(for: searchedRecipe, with: additionalFilters)
    self.dismiss(animated: true)
  }
}

//extension MacrosViewController {
//  // MARK: - Filtered Search
//  func filterRecipes(for recipe: String, with options: String) {
//    print(self.additionalFilters)
//    let listVC = RecipeListCollectionView()
//    dataprovider.getFilteredRecipes(for: recipe, with: options) { [weak self] (foodResult: Result<Response, Error>) in
//      guard let self = self else { return }
//      switch foodResult {
//        case .success(let model):
//          listVC.model = model as Response
//          // if there are no results for the searched phrase, display alert
//          listVC.noResults(for: recipe)
//          
//          // total number of results
//          guard let totalCount = listVC.model.totalResults else { return }
//          self.title = "\(self.searchedRecipe.capitalized) (\(totalCount))"
//          
//        case .failure(let error):
//          print(error)
//      }
//      print("CollectionVC - Self.AdditionalFilters", self.additionalFilters)
//      listVC.recipeCollection.reloadData()
//    }
//  }
//}
