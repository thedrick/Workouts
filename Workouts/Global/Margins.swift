//
//  Margins.swift
//  Workouts
//
//  Created by tyler_hedrick on 4/16/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

enum Sizes {

  static let micro: CGFloat = 4
  static let small: CGFloat = 12
  static let regular: CGFloat = 24
  static let large: CGFloat = 48

}

enum Margins {

  static let row = UIEdgeInsets(
    top: Sizes.small,
    left: Sizes.regular,
    bottom: Sizes.small,
    right: Sizes.regular)

  static let overlayContainer = UIEdgeInsets(
    top: Sizes.large,
    left: Sizes.regular,
    bottom: Sizes.large,
    right: Sizes.regular)

}
