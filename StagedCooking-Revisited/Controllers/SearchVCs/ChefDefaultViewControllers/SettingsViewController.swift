//
//  SettingsViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/10/22.
//

// Settings:

// Sign Out
// Family Sharing  ???
// Notifications
// App Icon
// Default Intolerances
// Default Diets
// Default Macros
// Delete Account

// Thought: Linking accounts.

import Firebase
import FirebaseAuth
import FirebaseCore
import Foundation
import UIKit

enum SettingsSection: String, CaseIterable {
  case account, defaults
}

class SettingsViewController: UIViewController {
  
  var sections = [Settings]()
  
  let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.backgroundColor = .clear
    return table
  }()
  
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

extension SettingsViewController {
  func setupSections() {
    
    tableView.reloadData()
  }
}

extension SettingsViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config  = cell.defaultContentConfiguration()
    switch indexPath.item {
      case 0:
        config.text = "Sign Out"
      default:
        config.text = "FART"
    }
    cell.contentConfiguration = config
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "FART!!!"
  }
}

extension SettingsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.item {
      case 0:
        print("poop")
        logOut()
      default:
        print("fart")
    }
  }
}

extension SettingsViewController {
//  @objc
  func logOut() {
    let alert = UIAlertController(title: "Sign Out of Staged Cooking?", message: "Are you sure you want to sign out?", preferredStyle: .alert)
    let cancelLogOut = UIAlertAction(title: "Cancel", style: .cancel) { _ in
      self.dismiss(animated: true)
    }
    let bounceOut = UIAlertAction(title: "Sign Out", style: .default) { _ in
      do {
        try Auth.auth().signOut()
        let vc = LandingViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(vc, animated: true)
      } catch let error {
        print(String(describing: error))
      }
    }
    alert.addAction(cancelLogOut)
    alert.addAction(bounceOut)
    present(alert, animated: true)
  }
}
