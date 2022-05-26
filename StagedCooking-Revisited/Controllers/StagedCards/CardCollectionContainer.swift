//
//  CardCollectionContainer.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/22/22.
//

import Foundation
import UIKit

import UIKit

class CardCollectionContainer: UIViewController {
  
  var cards = [Card]()
  
  var dataSource: UICollectionViewDiffableDataSource<Int, Int>! = nil

  var collectionView: UICollectionView! = nil
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    configureHierarchy()
    configureDataSource()

  }
}


// MARK: - Delegate
extension CardCollectionContainer: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
  }
}

//extension CardCollectionContainer: UICollectionViewDelegateFlowLayout {
//  private enum Layout {
//    static let height = CGFloat(100)
//    static let width = CGFloat(100)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    return CGSize(width: Layout.width, height: Layout.height)
//  }
//}

// MARK: - Where the magic happens
extension CardCollectionContainer {
  
  func createLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout {
      
      (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
      let leadingItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.5), // Anything above 1 breaks, the width of the first item(s)
          heightDimension: .fractionalHeight(1))) // Anything above 1 breaks, the height of the second item(s)
      
      // if in a 1:1 sizing (
      leadingItem.contentInsets = NSDirectionalEdgeInsets(
        top: 10, // space between an object's bottom anchor and the cell's top anchor
        leading: 10, // space between an objects trailing and the cell's leading anchor
        bottom: 10, // Space between the bottom of a cell and the tope edge of what's above it
        trailing: 10  // Space between a cell's trailing anchor and the object's trailing anchor

      )
      
      let trailingItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0))
      )
      
      // if in a 1:1 sizing (leadingItem.Size : trailingItem.Size), does nothing otherwise
      trailingItem.contentInsets = NSDirectionalEdgeInsets(
        top: 10, // space between an object's bottom anchor and the cell's top anchor
        leading: 10, // space between an object's trailing and the cell's leading anchor
        bottom: 10, // space between a cell's bottom anchor and an object's top anchor
        trailing: 100 // space between a cell's trailing anchor and an object's leading anchor
      )
      
      // Grouping allows for a set of cell's to cluster together and behave similarly
      let trailingGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
         heightDimension: .fractionalHeight(1.0)
        ),
        subitem: trailingItem, count: 3)
      
      
      let containerGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.85),
          heightDimension: .fractionalHeight(0.4)
        ),
        subitems: [leadingItem, trailingGroup])
      
      
      let section = NSCollectionLayoutSection(group: containerGroup)
      section.orthogonalScrollingBehavior = .continuous
      
      return section
      
    }
    return layout
  }
  
}


// MARK: - Setting up the CollectionView
extension CardCollectionContainer {
  func configureHierarchy() {
    collectionView = UICollectionView(
      frame: view.bounds,
      collectionViewLayout: createLayout()
    )
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    collectionView.backgroundColor = .systemBackground
    view.addSubview(collectionView)
    collectionView.delegate = self
  }
  
  func configureDataSource() {
    let cellRegistration = UICollectionView.CellRegistration<CardCell, Int> { (cell, indexPath, identifier) in
      // Populate the cell with our item description.
      cell.cardLabel.text = "Poop: \(indexPath.section), Fart: \(indexPath.item)"
      
      cell.contentView.backgroundColor = .cyan
      
      cell.contentView.layer.borderColor = UIColor.black.cgColor
      
      cell.contentView.layer.borderWidth = 1
      
      cell.contentView.layer.cornerRadius = 8
      
      cell.cardLabel.textAlignment = .center
      
      cell.cardLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) {
      (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
      // Return the cell.
      return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
    }
    
    // initial data
    var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
    var identifierOffset = 0
    let itemsPerSection = 30
    for section in 0..<5 {
      snapshot.appendSections([section])
      let maxIdentifier = identifierOffset + itemsPerSection
      snapshot.appendItems(Array(identifierOffset..<maxIdentifier))
      identifierOffset += itemsPerSection
    }
    dataSource.apply(snapshot, animatingDifferences: false)
  }
}



