//
//  UIImage-Extension.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import Foundation
import UIKit


extension UIImageView {
  /**
   Extension of a UIImageView to use a URL(string:) as it's image.
   
   ExampleUsage:
   
   Before: imageView.image = *Result of method to unwrap and assign the image to the imageView*.
   
   After: imageView.loadImage(url: "https...").
   
   Very useful when receiving a URL to an image as part of a network response.
   */
  
  func loadImage(url: String)  {
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
  
  func loadImageToPass(url: String) -> UIImage  {
    //  guard let url = URL(string: url) else { return }
    var recipeImg = UIImage()
    if let url = URL(string: url) {
      DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
          if let image = UIImage(data: data) {
            DispatchQueue.main.async {
              recipeImg = image
              
            }
          }
        }
      }
    }
    return recipeImg
  }
}
  
  // Source:
  // https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
