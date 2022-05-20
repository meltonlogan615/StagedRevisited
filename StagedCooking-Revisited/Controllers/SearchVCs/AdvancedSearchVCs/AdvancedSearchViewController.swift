//
//  AdvancedSearchViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/18/22.
//

import Foundation

import UIKit

class AdvancedSearchViewController: UIViewController {
  
  var titleString = String()
  
  
  private let advancedCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    var advancedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    advancedCollection.backgroundColor = K.primary
    advancedCollection.layer.zPosition = 10
    return advancedCollection
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissView))
    title = titleString
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
  }
  
  func layout() {
    view.addSubview(advancedCollection)
    NSLayoutConstraint.activate([
      advancedCollection.topAnchor.constraint(equalTo: view.topAnchor),
      advancedCollection.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: advancedCollection.trailingAnchor, multiplier: 4),
      advancedCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

extension AdvancedSearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let cellCount = 5
    return cellCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "advancedCell", for: indexPath) as! AdvancedCell
    switch indexPath{
      case [0, 0]:
        cell.titleLabel.text = "Cuisines"
        cell.image.image = UIImage(systemName: "globe")
      case [0, 1]:
        cell.titleLabel.text = "Diets"
        cell.image.image = UIImage(systemName: "scalemass")
      case [0, 2]:
        cell.titleLabel.text = "Intolerances"
        cell.image.image = UIImage(systemName: "nosign")
      case [0, 3]:
        cell.titleLabel.text = "Macros"
        cell.image.image = UIImage(systemName: "atom")
      case [0, 4]:
        cell.titleLabel.text = "Meal Types"
        cell.image.image = UIImage(systemName: "checklist")
      default:
        break
    }
    return cell
  }
}

extension AdvancedSearchViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch indexPath{
      case [0, 0]:
        print("Cuisines")
        let vc = CuisinesViewController()
        present(vc, animated: true)
        
      case [0, 1]:
        print("Diets")

      case [0, 2]:
        print("Intolerances")
        let vc = IntolerancesViewController()
        present(vc, animated: true)

      case [0, 3]:
        print("Macros")

      case [0, 4]:
        print("Meal Types")
      

      default:
        break
    }
  }
}

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


