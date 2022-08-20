//
//  SettingsViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Firebase
import FirebaseAuth
import FirebaseCore
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
    self.title = "Settings"
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

extension SettingsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.modalBG
    cell.layer.cornerRadius = 8
    cell.clipsToBounds = true
    
    var config = cell.defaultContentConfiguration()
    switch indexPath.item {
      case 0:
        config.text = "Sign Out"
        config.textProperties.alignment = .center
      case 1:
        config.text = "Delete Account"
        cell.backgroundColor = K.scAccent
        config.textProperties.alignment = .center
      default:
        config.text = "FART"
    }
    cell.contentConfiguration = config
    return cell
  }
}

extension SettingsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.item {
      case 0:
        signOut()
      case 1:
        print("Delete Account")
      default:
        print("Default")
    }
  }
}

extension SettingsViewController {
  @objc
  func signOut() {
    let auth = Auth.auth()
    do {
      try auth.signOut()
    } catch let quitError as NSError {
      print("Error signing out", quitError)
    }
  }
}
