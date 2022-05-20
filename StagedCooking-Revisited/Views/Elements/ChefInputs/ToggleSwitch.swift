//
//  ToggleSwitch.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation
import UIKit

class ToggleSwitch: UIControl {
  
  public var onTintColor = UIColor(red: 144/255, green: 202/255, blue: 119/255, alpha: 1) {
    didSet {
      self.setupUI()
    }
  }
  public var offTintColor = UIColor.lightGray {
    didSet {
      self.setupUI()
    }
  }
  public var cornerRadius: CGFloat = 0.5 {
    didSet {
      self.layoutSubviews()
    }
  }
  public var thumbTintColor = UIColor.white {
    didSet {
      self.thumbView.backgroundColor = self.thumbTintColor
    }
  }
  public var thumbCornerRadius: CGFloat = 0.5 {
    didSet {
      self.layoutSubviews()
    }
  }
  public var thumbSize = CGSize.zero {
    didSet {
      self.layoutSubviews()
    }
  }
  public var isOn = true
  public var animationDuration: Double = 0.5
  
  fileprivate var thumbView = UIView(frame: CGRect.zero)
  fileprivate var onPoint = CGPoint.zero
  fileprivate var offPoint = CGPoint.zero
  fileprivate var isAnimating = false
  
  
  public var padding: CGFloat = 1 {
    didSet {
      self.layoutSubviews()
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
    self.thumbView.backgroundColor = self.thumbTintColor
    self.thumbView.isUserInteractionEnabled = false
    self.addSubview(self.thumbView)
    
    self.thumbView.layer.shadowColor = UIColor.black.cgColor
    self.thumbView.layer.shadowRadius = 1.5
    self.thumbView.layer.shadowOpacity = 0.4
    self.thumbView.layer.shadowOffset = CGSize(width: 0.75, height: 2)
  }
}

extension ToggleSwitch {
  public override func layoutSubviews() {
    super.layoutSubviews()
    if !self.isAnimating {
      self.layer.cornerRadius = self.bounds.size.height * self.cornerRadius
      self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
      self.frame.size.width = 50
      self.frame.size.height = 30
//      = CGRect(x: 50, y: 50, width: 50, height: 30)
      
      // thumb managment
      
      let thumbSize = self.thumbSize != CGSize.zero ? self.thumbSize : CGSize(width:
                                                                                self.bounds.size.height - 2, height: self.bounds.height - 2)
      let yPostition = (self.bounds.size.height - thumbSize.height) / 2
      self.onPoint = CGPoint(x: self.bounds.size.width - thumbSize.width - self.padding, y: yPostition)
      self.offPoint = CGPoint(x: self.padding, y: yPostition)
      self.thumbView.frame = CGRect(origin: self.isOn ? self.onPoint : self.offPoint, size: thumbSize)
      self.thumbView.layer.cornerRadius = thumbSize.height * self.thumbCornerRadius
    }
  }
}

extension ToggleSwitch {
  private func animate() {
    self.isOn = !self.isOn
    self.isAnimating = true
    UIView.animate(withDuration: self.animationDuration, delay: 0, usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 0.5, options: [UIView.AnimationOptions.curveEaseOut,
                                                         UIView.AnimationOptions.beginFromCurrentState], animations: {
      self.thumbView.frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x
      self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
    }, completion: { _ in
      self.isAnimating = false
      self.sendActions(for: UIControl.Event.valueChanged)
    })
  }
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    super.beginTracking(touch, with: event)
    self.animate()
    return true
  }
}


