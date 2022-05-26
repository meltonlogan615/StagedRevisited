//
//  UIView-Blurry.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/25/22.
//

import Foundation
import UIKit

extension UIViewController {
  func blur() -> UIVisualEffectView {
    let backgroundFilter = UIBlurEffect(style: .dark)
    let blurredBackground = UIVisualEffectView(effect: backgroundFilter)
    blurredBackground.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
//    view.addSubview(blurredBackground)
    return blurredBackground
  }
}
