//
//  BasicRow.swift
//  Workouts
//
//  Created by Tyler Hedrick on 4/18/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

final class BasicRow: UIView {
  
  init() {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    setUpViews()
    setUpConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var titleText: String? {
    set { titleLabel.text = newValue }
    get { return titleLabel.text }
  }
  
  public var subtitleText: String? {
    set { subtitleLabel.text = newValue }
    get { return subtitleLabel.text }
  }
  
  // MARK: Private
  
  private let titleLabel = Label(textStyle: TextStyle(font: Fonts.regularBold))
  private let subtitleLabel = Label(textStyle: TextStyle(font: Fonts.micro))
  private let stackView = UIStackView()
  
  private func setUpViews() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(subtitleLabel)
    stackView.axis = .vertical
    stackView.spacing = Sizes.micro
  }
  
  private func setUpConstraints() {
    layoutMargins = Margins.row
    stackView.constrainToSuperviewMargins()
  }
  
}
