//
//  UIView+Constraints.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

extension UIView {

  enum LayoutAnchor {
    case left
    case right
    case top
    case bottom
    case leading
    case trailing
    case leadingMargin
    case trailingMargin
    case topMargin
    case bottomMargin
    case centerX
    case centerY
  }
  
  func constrainToSuperviewMargins(anchors: [LayoutAnchor] = [.leadingMargin, .trailingMargin, .topMargin, .bottomMargin]) {
    precondition(superview != nil, "Did you forget to addSubview?")
    constrain(to: superview!, anchors: anchors)
  }
  
  func constrainToSuperview(anchors: [LayoutAnchor] = [.leading, .trailing, .bottom, .top]) {
    precondition(superview != nil, "Did you forget to addSubview?")
    constrain(to: superview!, anchors: anchors)
  }

  func constrain(to view: UIView, anchors: [LayoutAnchor]) {
    anchors.forEach { apply(anchor: $0, toView: view) }
  }

  func apply(anchor: LayoutAnchor, toView view: UIView) {
    switch anchor {
    case .left:
      leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    case .right:
      rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    case .top:
      topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    case .bottom:
      bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    case .leading:
      leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    case .trailing:
      trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    case .leadingMargin:
      leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
    case .trailingMargin:
      trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    case .topMargin:
      topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
    case .bottomMargin:
      bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    case .centerX:
      centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    case .centerY:
      centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
  }
  
}
