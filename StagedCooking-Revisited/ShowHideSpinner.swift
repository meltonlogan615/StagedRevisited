//
//  ShowHideSpinner.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/9/22.
//

import Foundation
import UIKit

struct ActivityView {
  let indicator = SpinnerViewController()
  
 
  func showActivity(_ view: UIView) {
    view.isHidden = true
    indicator.view.frame = view.frame
    view.addSubview(indicator.view)
  }
  
  func removeActivity(_ view: UIView) {
    indicator.willMove(toParent: nil)
    view.isHidden = false
    indicator.view.removeFromSuperview()
    indicator.removeFromParent()
  }
  
}
