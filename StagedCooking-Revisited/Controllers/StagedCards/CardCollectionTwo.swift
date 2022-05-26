//
//  CardCollectionTwo.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/22/22.
//

import Foundation
import UIKit

class CardCollectionTwo: UICollectionViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = K.primary
    collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.isPagingEnabled = true
  }
}


// MARK: - DataSource
extension CardCollectionTwo {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCell
    cell.cardLabel.text = "Poop \(indexPath.item + 1)"
    cell.directions.text = K.testText
    return cell
  }
}

// MARK: - Flow Delegate
extension CardCollectionTwo: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height - 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

// MARK: - Orthogonal
extension CardCollectionTwo {
  func createLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout {
      
      (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
      
      let leadingItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .fractionalHeight(1)))
      
    
      leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
      
      let trailingItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .fractionalHeight(0.3)))
      
      trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
      
      
      let trailingGroup = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                           heightDimension: .fractionalHeight(1.0)),
        subitem: trailingItem, count: 2)
      
      
      let containerGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),
                                           heightDimension: .fractionalHeight(0.4)),
        subitems: [leadingItem, trailingGroup])
      
      let section = NSCollectionLayoutSection(group: containerGroup)
      section.orthogonalScrollingBehavior = .continuous
      
      return section
      
    }
    return layout
  }

}


//   +---------------------------------------------------------------------------+
//   | +---------------------------------+  +---------------------------------+  |
//   | |             LABEL 1             |  |          LABEL 2                |  |
//   | | ------------------------------- |  |---------------------------------|  |
//   | |  LINE 1                         |  |  LINE 1                         |  |
//   | |  LINE 2                         |  |  LINE 2                         |  |
//   | |  LINE 3                         |  |  LINE 3                         |  |
//   | |                                 |  |                                 |  |
//   | |---------------------------------|  |---------------------------------|  |
//   | |           Vertical              |  |         Vertical                |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | |                                 |  |                                 |  |
//   | +---------------------------------+  +---------------------------------+  |
//   +---------------------------------------------------------------------------+
