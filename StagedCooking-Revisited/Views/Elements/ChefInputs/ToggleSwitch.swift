//
//  ToggleSwitch.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

/**
 Custom `UISwitch`
 
 
 Uses `UISwitch`'s superClass of `UIControl` to allow for greater flexibility.
 */

class ToggleSwitch: UIControl {
  var onTint = K.scGreen {
    didSet {
      self.setupUI()
    }
  }
  var offTint = K.scAccent {
    didSet {
      self.setupUI()
    }
  }
  
  var cornerRadius = CGFloat(0.25) {
    didSet {
      self.layoutSubviews()
    }
  }
  
  var thumbTint = K.primary {
    didSet {
      self.thumbView.backgroundColor = self.thumbTint
    }
  }
  
  var thumbCornerRadius = CGFloat(0.25) {
    didSet {
      self.layoutSubviews()
    }
  }
  
  var thumbSize = CGSize.zero {
    didSet {
      self.layoutSubviews()
    }
  }
  
  var padding: CGFloat = 1 {
    didSet {
      self.layoutSubviews()
    }
  }
  
  var isOn = false
  var animationDuration = Double(0.5)
  
  private var thumbView = UIView(frame: CGRect.zero)
  private var onPoint = CGPoint.zero
  private var offPoint = CGPoint.zero
  private var isAnimating = false
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    if !self.isAnimating {
      self.layer.cornerRadius = self.bounds.self.height * self.cornerRadius
      self.backgroundColor = self.isOn ? self.onTint : self.offTint
      
      let thumbSize = self.thumbSize != CGSize.zero ? self.thumbSize : CGSize(width: self.bounds.size.height - 2, height: self.bounds.height - 2)
      
      let yPosition = (self.bounds.size.height - thumbSize.height) / 2
      
      self.onPoint = CGPoint(x: self.bounds.size.width - thumbSize.width - self.padding, y: yPosition)
      self.offPoint = CGPoint(x: self.padding, y: yPosition)
      
      self.thumbView.frame = CGRect(origin: self.isOn ? self.onPoint : self.offPoint, size: thumbSize)
      self.thumbView.layer.cornerRadius = thumbSize.height * self.thumbCornerRadius
      
    }
  }
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    super.beginTracking(touch, with: event)
    self.animate()
    return true
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 50, height: 24)
  }
  
}

extension ToggleSwitch {
  
  private func clear() {
    for view in self.subviews {
      view.removeFromSuperview()
    }
  }
  
  func setupUI() {
    self.clear()
    self.clipsToBounds = false
    self.thumbView.backgroundColor = self.thumbTint
    self.thumbView.isUserInteractionEnabled = false
    self.thumbView.layer.shadowColor = UIColor.systemGray.cgColor
    self.thumbView.layer.shadowRadius = 1.5
    self.thumbView.layer.shadowOpacity = 0.4
    self.thumbView.layer.shadowOffset = CGSize(width: 0.5, height: 2)
    self.addSubview(self.thumbView)
  }
  
  private func animate() {
    self.isOn = !self.isOn
    self.isAnimating = true
    UIView.animate(withDuration: self.animationDuration,
                   delay: 0,
                   usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 0.5,
                   options: [
                    UIView.AnimationOptions.curveEaseOut,
                    UIView.AnimationOptions.beginFromCurrentState
                   ],
                   animations: {
      self.thumbView.frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x
      self.backgroundColor = self.isOn ? self.onTint : self.offTint
    }, completion: { _ in
      self.isAnimating = false
      self.sendActions(for: UIControl.Event.valueChanged)
    })
  }
}
