//
//  SettingsViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
  let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.backgroundColor = .clear
    return table
  }()
  
  
  override func viewWillAppear(_ animated: Bool) {
    tableView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Favorites"
    view.backgroundColor = K.primary
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    layout()
  }
}

extension SettingsViewController {
  func layout() {
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 2),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension FavoritesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 1
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    config.text "FART"
    cell.layer.cornerRadius = 8
    cell.clipsToBounds = true
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.modalBG
    cell.contentConfiguration = config
    return cell
  }
}

extension FavoritesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    
  }
}
