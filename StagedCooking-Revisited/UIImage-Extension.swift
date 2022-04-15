//
//  UIImage-Extension.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit

extension UIImageView {
  
  func loadImage(url: String) {
    guard let url = URL(string: url) else { return }
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}

// Source:
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
