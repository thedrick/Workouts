//
//  Fonts.swift
//  Workouts
//
//  Created by tyler_hedrick on 4/16/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

enum Fonts {

  static var large = UIFont.preferredFont(forTextStyle: .title1)
  static var titleHeader = UIFont.preferredFont(forTextStyle: .title2)
  static var button = UIFont.preferredFont(forTextStyle: .body)
  static var regularBold = UIFont.preferredFont(forTextStyle: .headline)
  static var micro = UIFont.preferredFont(forTextStyle: .caption2)

  static func fontAwesome(ofSize size: CGFloat) -> UIFont {
    return UIFont.fontAwesome(ofSize: size)
  }

}
