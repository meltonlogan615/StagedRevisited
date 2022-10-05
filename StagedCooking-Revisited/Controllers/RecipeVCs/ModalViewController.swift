//
//  ModalViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//


import UIKit

protocol ModalDataSource: AnyObject {
  func showModal(_ sender: UIButton)
}

/*
 Acts as a holder for the Modal Views
*/
class ModalViewController: UIViewController {
  
  var modalView = SCModal()
  var closeButton = DetailsButton()
  
  var modalLabel = UILabel()
  var labelText = String()
  
  var sender = String()
  var ingredients: Ingredients?
  var summary: String?
  var macros: Macros?
  var diets: DietInfo?
  
  override func viewWillAppear(_ animated: Bool) {
    style()
    layout()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    modalLabel.addKerning(to: labelText.capitalized)
    selectView()
  }
}

extension ModalViewController {
  func style() {
    view.addSubview(blur())
    
    modalLabel.translatesAutoresizingMaskIntoConstraints = false
    modalLabel.font = .systemFont(ofSize: 36, weight: .semibold)
    modalLabel.textColor = K.primary
    modalLabel.textAlignment = .center
    
    modalView.translatesAutoresizingMaskIntoConstraints = false
    modalView.layer.cornerRadius = 8
    modalView.clipsToBounds = true
    modalView.layer.borderColor = K.primary?.cgColor
    modalView.layer.borderWidth = 2
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.setTitle("Close", for: [])
    closeButton.addTarget(self, action: #selector(dismissView), for: .primaryActionTriggered)
    closeButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)    
  }
  
  func layout() {
    
    view.addSubview(modalLabel)
    NSLayoutConstraint.activate([
      modalLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: modalLabel.trailingAnchor, multiplier: 4),
      modalLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4)
    ])
    
    view.addSubview(modalView)
    NSLayoutConstraint.activate([
      modalView.topAnchor.constraint(equalToSystemSpacingBelow: modalLabel.bottomAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: modalView.trailingAnchor, multiplier: 4),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: modalView.bottomAnchor, multiplier: 16),
      modalView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
    ])
    
    view.addSubview(closeButton)
    NSLayoutConstraint.activate([
      closeButton.topAnchor.constraint(equalToSystemSpacingBelow: modalView.bottomAnchor, multiplier: 2),
      closeButton.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
      closeButton.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
      closeButton.heightAnchor.constraint(equalToConstant: 48)
    ])
  }
}

extension ModalViewController {
  private func selectView() {
    switch sender {
      case "ing":
        generateIngredientLabels()
      case "sum":
        layoutSummary()
      case "mac":
        generateMacrosLabels()
      default:
        break
    }
  }
}

// MARK: - Ingrediets
extension ModalViewController {
  func generateIngredientLabels() {
    guard let allIngredients = self.ingredients else { return }
    let labelIngredients = allIngredients.ingredients
    for i in 0 ..< labelIngredients.count {
      guard let name = labelIngredients[i].nameClean else { return }
      guard let measure = labelIngredients[i].measures else { return }
      
      guard let us = measure.us else { return }
      guard let usAmount = us.amount else { return }
      guard let usShort = us.unitShort else { return }
      
      guard let metric = measure.metric else { return }
      guard let metricAmount = metric.amount else { return }
      guard let metricShort = metric.unitShort else { return }
      
      let ingredientLine = LargeLabel()
      ingredientLine.translatesAutoresizingMaskIntoConstraints = false
      ingredientLine.text = "\(usAmount) \(usShort.capitalized) (\(metricAmount) \(metricShort)) \(name.capitalized)"
      let divder = Divider()
      modalView.detailsStack.addArrangedSubview(ingredientLine)
      modalView.detailsStack.addArrangedSubview(divder)
    }
  }
}

// MARK: - Layout Summary
extension ModalViewController {
  private func layoutSummary() {
    guard let summary = summary else { return }
    let summaryLabel = LargeLabel()
    summaryLabel.translatesAutoresizingMaskIntoConstraints = false
    summaryLabel.numberOfLines = 0
    summaryLabel.text = summary
    modalView.detailsStack.addArrangedSubview(summaryLabel)
    
  }

}

// MARK: - Macronutrients
extension ModalViewController {
  private func generateMacrosLabels() {
    guard let macros = macros?.macros else { return }
    for i in 0 ..< macros.count {
      let macrosLabel = MacrosLabelView()
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      guard let name = macros[i].name else { return }
      guard let amount = macros[i].amount else { return }
      guard let unit = macros[i].unit else { return }
      guard let percent = macros[i].percentOfDailyNeeds else { return }
      macrosLabel.translatesAutoresizingMaskIntoConstraints = false
      macrosLabel.titleLabel.text = name.capitalized + ":"
      macrosLabel.amountLabel.text = "\(amount) \(unit)"
      macrosLabel.dailyPercentLabel.text = "\(percent)% of Daily Needs"
      modalView.detailsStack.addArrangedSubview(macrosLabel)
      modalView.detailsStack.addArrangedSubview(divider)
    }
  }
}

