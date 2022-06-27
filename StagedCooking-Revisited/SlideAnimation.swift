//
//  SlideAnimation.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/19/22.
//

import Foundation
import UIKit

extension UIView {
  
  enum Direction: String {
    case top, leading, trailing, bottom
  }
  
  func slideIn(from: Direction, duration: TimeInterval, delay: TimeInterval, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
    // set the start position outside of bounds
  
    switch from {
      case .top:
        self.widthAnchor.constraint(equalTo: (self.superview?.widthAnchor)!).isActive = true
        self.bottomAnchor.constraint(equalTo: (self.superview?.safeAreaLayoutGuide.topAnchor)!).isActive = true
      case .leading:
        self.topAnchor.constraint(equalTo: (self.superview?.topAnchor)!).isActive = true
        self.trailingAnchor.constraint(equalTo: (self.superview?.leadingAnchor)!).isActive = true
      case .trailing:
        self.topAnchor.constraint(equalTo: (self.superview?.topAnchor)!).isActive = true
        self.leadingAnchor.constraint(equalTo: (self.superview?.trailingAnchor)!).isActive = true
      case.bottom:
        self.topAnchor.constraint(equalTo: (self.superview?.bottomAnchor)!).isActive = true
        self.widthAnchor.constraint(equalTo: (self.superview?.widthAnchor)!).isActive = true
    }
    
    // set the view constraints to end state
    UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
      NSLayoutConstraint.activate([
        self.topAnchor.constraint(equalTo: (self.superview?.safeAreaLayoutGuide.topAnchor)!),
        self.leadingAnchor.constraint(equalTo: (self.superview?.leadingAnchor)!),
        self.trailingAnchor.constraint(equalTo: (self.superview?.trailingAnchor)!)
      ])
      
    }, completion: completion)
  }
  
  // remove towards a specific direction
//  func slideOut(to: Direction, duration: TimeInterval, delay: TimeInterval, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
//    UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
//      guard let superview = self.superview else { return }
//      switch to {
//        case .top:
//          self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
//        case .leading:
//          self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        case .trailing:
//          self.leadingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
//        case .bottom:
//          self.topAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
//
//      }
//      self.removeFromSuperview()
//    }, completion: completion)
//  }
}
