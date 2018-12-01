//
//  Label.swift
//  Workouts
//
//  Created by Tyler Hedrick on 4/18/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

final class Label: UILabel {
  
  init(textStyle: TextStyle) {
    self.textStyle = textStyle
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var text: String? {
    didSet { textStyle.apply(with: text, to: self) }
  }
  
  // MARK: Private
  
  private let textStyle: TextStyle
  
}
