//
//  ActionHeader.swift
//  Workouts
//
//  Created by tyler_hedrick on 4/16/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

final class ActionHeader: UIView {

  init() {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .white
    setUpViews()
    setUpConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public var leftButtonText: String? {
    get { return leftButton.text }
    set { leftButton.text = newValue }
  }

  public var rightButtonText: String? {
    get { return rightButton.text }
    set { rightButton.text = newValue }
  }

  // MARK: Private

  private let leftButton = Button(style: .secondary)
  private let rightButton = Button(style: .primary)

  private func setUpViews() {
    addSubview(leftButton)
    addSubview(rightButton)
  }

  private func setUpConstraints() {
    layoutMargins = Margins.row
    leftButton.constrain(to: self, anchors: [.leadingMargin, .topMargin, .bottomMargin])
    rightButton.constrain(to: self, anchors: [.trailingMargin, .topMargin, .bottomMargin])
  }

}
