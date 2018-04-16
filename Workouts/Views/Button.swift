//
//  Button.swift
//  Workouts
//
//  Created by tyler_hedrick on 4/16/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

final class Button: UIButton {

  enum ButtonStyle {
    case primary
    case secondary
  }

  init(style: ButtonStyle) {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    addTarget(
      self,
      action: #selector(handleTap(_:)),
      for: .touchUpInside)
    switch style {
    case .primary:
      applyPrimaryStyle()
    case .secondary:
      applySecondaryStyle()
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public var text: String? {
    get { return title(for: .normal) }
    set { setTitle(newValue, for: .normal) }
  }

  public var tapHandler: ((Button) -> Void) = { _ in }

  // MARK: Private

  private func applySharedStyles() {
    titleLabel?.font = Fonts.button
  }

  private func applyPrimaryStyle() {
    applySharedStyles()
    setTitleColor(Colors.primaryColor, for: .normal)
  }

  private func applySecondaryStyle() {
    applySharedStyles()
    setTitleColor(Colors.secondaryAction, for: .normal)
  }

  @objc
  private func handleTap(_ button: Button) {
    tapHandler(self)
  }

}
