//
//  AdvancedSearchViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/18/22.
//

import Foundation
import UIKit

/**
 Collection VC for `AdvancedSearch` Options.
 
 Currently using a static count for the number of cells.
 */

class AdvancedSearchViewController: UIViewController {
  
  var titleString = String()
  
  private let advancedCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    var advancedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    advancedCollection.layer.zPosition = 10
    advancedCollection.backgroundColor = .clear
    return advancedCollection
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Advanced Search"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissView))
    
    advancedCollection.register(AdvancedCell.self, forCellWithReuseIdentifier: "advancedCell")
    advancedCollection.dataSource = self
    advancedCollection.delegate = self
    
    style()
    layout()
  }
}

extension AdvancedSearchViewController {
  func style() {
    advancedCollection.translatesAutoresizingMaskIntoConstraints = false
    advancedCollection.layer.zPosition = 10
  }
  
  func layout() {
    view.addSubview(advancedCollection)
    NSLayoutConstraint.activate([
      advancedCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      advancedCollection.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: advancedCollection.trailingAnchor, multiplier: 4),
      advancedCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

// MARK: - UICollectionViewDataSource
extension AdvancedSearchViewController: UICollectionViewDataSource {
  /// static `cellCount`
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let cellCount = 5
    return cellCount
  }
  
  /// `switch-case` though `indexPath.item` to set images and values.
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "advancedCell", for: indexPath) as! AdvancedCell
    switch indexPath.item {
      case 0:
        cell.titleLabel.text = "Cuisines"
        cell.image.image = UIImage(systemName: "globe")
      case 1:
        cell.titleLabel.text = "Diets"
        cell.image.image = UIImage(systemName: "scalemass")
      case 2:
        cell.titleLabel.text = "Intolerances"
        cell.image.image = UIImage(systemName: "nosign")
      case 3:
        cell.titleLabel.text = "Macros"
        cell.image.image = UIImage(systemName: "atom")
      case 4:
        cell.titleLabel.text = "Meal Types"
        cell.image.image = UIImage(systemName: "checklist")
      default:
        break
    }
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension AdvancedSearchViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedVC = FilterViewController()

    /// `switch-case` though `indexPath.item` to set the `OptionViewController.optionView`'s correct view & `title`.
    switch indexPath.item {
      case 0:
//        selectedVC.optionView = CuisinesView()
        selectedVC.viewTitle = "Cuisines"
        present(selectedVC, animated: true)
        
      case 1:
//        selectedVC.optionView = DietsView()
        selectedVC.viewTitle = "Diets"
        present(selectedVC, animated: true)

      case 2:
//        selectedVC.optionView = IntolerancesView()
        selectedVC.viewTitle = "Intolerances"
        present(selectedVC, animated: true)

      case 3:
        let selected = MacrosViewController()

        present(selected, animated: true)

      case 4:
//        selectedVC.optionView = MealTypesView()
        selectedVC.viewTitle = "Meal Types"
        present(selectedVC, animated: true)
      
      default:
        break
    }
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AdvancedSearchViewController: UICollectionViewDelegateFlowLayout {
  private enum LayoutConstant {
    static let spacing = CGFloat(4)
    static let itemHeight = CGFloat(200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
    return CGSize(width: width, height: LayoutConstant.itemHeight)
  }
  
  
  func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
    let itemsInRow = 2.0
    let totalSpacing = CGFloat(1.0 * spacing + (itemsInRow - 1) * spacing)
    let finalWidth = (width - totalSpacing) / itemsInRow
    return finalWidth - 40
  }
}




