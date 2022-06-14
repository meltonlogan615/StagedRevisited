//
//  FavoritesViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Foundation
import UIKit

class FavoritesViewController: UITableViewController {
  
  let chefDefault = ChefDefault()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.scOrange
  }
  
  
}

extension FavoritesViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    return cell
  }
}

extension FavoritesViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row)")
  }
}
