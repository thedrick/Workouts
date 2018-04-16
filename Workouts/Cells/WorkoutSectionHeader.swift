//
//  WorkoutSectionHeader.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/8/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

final class WorkoutSectionHeader: UIControl {
  
  init() {
    super.init(frame: .zero)
    setUpViews()
    setUpConstraints()
    self.addTarget(
      self,
      action: #selector(didTap),
      for: .touchUpInside)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var title: String? {
    set { titleLabel.text = newValue }
    get { return titleLabel.text }
  }
  
  public var didTapBlock: ((WorkoutSectionHeader) -> Void)? = nil {
    didSet { chevronLabel.isHidden = (didTapBlock == nil) }
  }
  
  // MARK: Private
  
  private let titleLabel = UILabel()
  private let chevronLabel = UILabel()
  
  private func setUpViews() {
    backgroundColor = Colors.primaryColor
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = Fonts.regularBold
    titleLabel.textColor = .white
    
    chevronLabel.translatesAutoresizingMaskIntoConstraints = false
    chevronLabel.textColor = .white
    chevronLabel.font = UIFont.fontAwesome(ofSize: 17)
    chevronLabel.text = String.fontAwesomeIcon(name: .chevronRight)
    chevronLabel.isHidden = true
    
    addSubview(titleLabel)
    addSubview(chevronLabel)
  }
  
  private func setUpConstraints() {
    titleLabel.constrainToSuperviewMargins()
    chevronLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
    chevronLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    chevronLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
  }
  
  @objc private func didTap() {
    didTapBlock?(self)
  }
  
}
