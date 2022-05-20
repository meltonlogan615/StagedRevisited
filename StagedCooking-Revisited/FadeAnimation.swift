//
//  FadeAnimation.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/14/22.
//

import Foundation
import UIKit

extension UIView {
  func fadeIn(_ duration: TimeInterval, delay: TimeInterval, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
    UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
      self.alpha = 1.0
    }, completion: completion)  }
  
  func fadeOut(_ duration: TimeInterval, delay: TimeInterval, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
    UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
      self.alpha = 0.0
    }, completion: completion)
  }
}
