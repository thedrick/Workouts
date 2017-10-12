//
//  UIView+Constraints.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

extension UIView {
  
  func constrainToSuperviewMargins() {
    guard let superview = superview else { return }
    leadingAnchor.constraint(equalTo: superview.layoutMarginsGuide.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: superview.layoutMarginsGuide.trailingAnchor).isActive = true
    topAnchor.constraint(equalTo: superview.layoutMarginsGuide.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: superview.layoutMarginsGuide.bottomAnchor).isActive = true
  }
  
}
