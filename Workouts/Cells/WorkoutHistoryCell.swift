//
//  WorkoutHistoryCell.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/22/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

final class WorkoutHistoryCell: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupCosntraints()
    accessoryType = .disclosureIndicator
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Public
  
  public var supertitle: String? {
    set { supertitleLabel.text = newValue }
    get { return supertitleLabel.text }
  }
  
  public var title: String? {
    set { titleLabel.text = newValue }
    get { return titleLabel.text }
  }
  
  // MARK: Private
  
  private let stackView = UIStackView()
  private let supertitleLabel = UILabel()
  private let titleLabel = UILabel()
  
  private func setupViews() {
    [stackView, supertitleLabel, titleLabel].forEach { v in
      v.translatesAutoresizingMaskIntoConstraints = false
    }
    contentView.addSubview(stackView)
    stackView.addArrangedSubview(supertitleLabel)
    stackView.addArrangedSubview(titleLabel)
    stackView.axis = .vertical
    stackView.spacing = 8
    
    supertitleLabel.font = Fonts.micro
    titleLabel.font = Fonts.regularBold
  }
  
  private func setupCosntraints() {
    stackView.constrainToSuperviewMargins()
  }
  
}
