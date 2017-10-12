//
//  ExerciseRow.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

final class ExerciseComponentStackView: UIView {
  
  init(title: String? = nil, value: String? = nil) {
    super.init(frame: .zero)
    setUpViews()
    setUpConstraints()
    self.translatesAutoresizingMaskIntoConstraints = false
    self.title = title
    self.value = value
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var title: String? {
    get { return titleLabel.text }
    set { titleLabel.text = newValue }
  }
  
  public var value: String? {
    get { return valueLabel.text }
    set { valueLabel.text = newValue }
  }
  
  private let stackView = UIStackView()
  private let titleLabel = UILabel()
  private let valueLabel = UILabel()
  
  private func setUpViews() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    valueLabel.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.axis = .vertical
    stackView.alignment = .center
    
    titleLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
    valueLabel.font = UIFont.preferredFont(forTextStyle: .title1)

    addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(valueLabel)
  }
  
  private func setUpConstraints() {
    stackView.constrainToSuperviewMargins()
  }
  
}

final class ExerciseRow: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUpViews()
    setUpConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var number: Int = 0 {
    didSet { numberLabel.text = "#\(number)" }
  }
  
  public var repCount: String? {
    get { return repsStackView.value }
    set { repsStackView.value = newValue }
  }
  
  public var weight: String? {
    get { return weightStackView.value }
    set { weightStackView.value = newValue }
  }
  
  public var isComplete: Bool {
    get { return accessoryType == .checkmark }
    set { accessoryType = newValue ? .checkmark : .none }
  }
  
  public func toggleComplete() {
    isComplete = !isComplete
  }
  
  private func setUpViews() {
    numberLabel.translatesAutoresizingMaskIntoConstraints = false
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(numberLabel)
    addSubview(stackView)
    
    stackView.axis = .horizontal
    stackView.spacing = 24
    stackView.addArrangedSubview(repsStackView)
    stackView.addArrangedSubview(weightStackView)
    
    repsStackView.title = "REPS"
    weightStackView.title = "LBS"
  }
  
  private func setUpConstraints() {
    numberLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
    numberLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
    numberLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    
    stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  private let numberLabel = UILabel()
  private let repsStackView = ExerciseComponentStackView()
  private let weightStackView = ExerciseComponentStackView()
  private let stackView = UIStackView()
  
}
