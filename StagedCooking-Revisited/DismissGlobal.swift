//
//  ViewController-Extensions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//
import Foundation
import UIKit

 
extension UIViewController {
  /// Simple Dismiss View method available to any UIViewControllers for a button's #selector(argument)
  @objc func dismissView(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true)
  }
}

