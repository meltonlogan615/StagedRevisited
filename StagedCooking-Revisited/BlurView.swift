//
//  BlurView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/25/22.
//
import Foundation
import UIKit

extension UIViewController {
  /**
   Extension on UIViewController that returns a *UIVisualEffectView*.
   
   Only current is is in ModalViewController.
   */
  func blur() -> UIVisualEffectView {
    let backgroundFilter = UIBlurEffect(style: .systemMaterialDark)
    let blurredBackground = UIVisualEffectView(effect: backgroundFilter)
    blurredBackground.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
    return blurredBackground
  }
}

extension UIView {
  func blurry() -> UIVisualEffectView {
    let backgroundFilter = UIBlurEffect(style: .systemMaterialDark)
    let blurredBackground = UIVisualEffectView(effect: backgroundFilter)
    blurredBackground.frame = CGRect(x: 0, y: 0, width: frame.maxX, height: frame.maxY)
    return blurredBackground
  }
}
