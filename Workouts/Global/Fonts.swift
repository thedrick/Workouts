//
//  Fonts.swift
//  Workouts
//
//  Created by tyler_hedrick on 4/16/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

struct TextStyle {
  
  init(font: UIFont, color: UIColor = Colors.text) {
    self.font = font
    self.color = color
  }
  
  public let font: UIFont
  public let color: UIColor
  
  public var textAttributes: [NSAttributedStringKey: Any] {
    return [
      .font: font,
      .foregroundColor: color
    ]
  }
  
  public func apply(with text: String?, to label: UILabel) {
    guard let text = text else {
      label.text = nil
      return
    }
    label.attributedText = NSAttributedString(
      string: text,
      attributes: textAttributes)
  }
}

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
