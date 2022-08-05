//
//  SettingsViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/10/22.
//

// Settings:
// Family Sharing
// Notifications
// App Icon
// Default Intolerances
// Default Diets
// Default Macros
// Delete Account

// Thought: Linking accounts.

import Foundation
import UIKit

class SettingsViewController: UIViewController {
  
  var settingsCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    var settingsCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    settingsCollection.layer.zPosition = 10
    settingsCollection.backgroundColor = K.primary
    return settingsCollection
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    super.viewDidLoad()
    view.backgroundColor = K.primary
    title = "Settings"
    navigationController?.navigationBar.prefersLargeTitles = true
    settingsCollection.register(SettingsCell.self, forCellWithReuseIdentifier: "cell")
    settingsCollection.dataSource = self
    settingsCollection.delegate = self
    style()
    layout()
  }
}

extension SettingsViewController {
  
  func style() {
    settingsCollection.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(settingsCollection)
    NSLayoutConstraint.activate([
      settingsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      settingsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingsCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

extension SettingsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 17
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SettingsCell
    cell.cellLabel.text = "FART"
    cell.backgroundColor = K.modalBG
    cell.notDarkYet()
//    cell.titleLabel.text = "FART"
//    cell.image.image = nil
    return cell
  }
  
}


extension SettingsViewController: UICollectionViewDelegateFlowLayout {
  private enum LayoutConstant {
    static let spacing = CGFloat(18)
    static let itemHeight = CGFloat(56)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
    return CGSize(width: width, height: LayoutConstant.itemHeight)
  }
  
  func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
    let itemsInRow = 1.0
    let totalSpacing = CGFloat(2.0 * spacing + (itemsInRow - 1.0) * spacing)
    let finalWidth = (width - totalSpacing) / itemsInRow
    return finalWidth - 5.0
  }
}
