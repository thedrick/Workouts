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
    get { return valueField.text }
    set { valueField.text = newValue }
  }
  
  public var isEditable: Bool = false {
    didSet { valueField.isEnabled = isEditable }
  }
  
  public var textChangedBlock: ((String?) -> Void) = { _ in }
  
  fileprivate let stackView = UIStackView()
  fileprivate let titleLabel = UILabel()
  fileprivate let valueField = UITextField()
  
  private func setUpViews() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    valueField.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.axis = .vertical
    stackView.alignment = .center
    
    titleLabel.font = Fonts.micro
    valueField.font = Fonts.large
    
    valueField.isEnabled = false
    valueField.keyboardType = .numberPad
    valueField.returnKeyType = .done
    valueField.delegate = self
    let keyboardToolbar = KeyboardToolbar(responder: valueField)
    keyboardToolbar.sizeToFit()
    valueField.inputAccessoryView = keyboardToolbar

    addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(valueField)
  }
  
  private func setUpConstraints() {
    stackView.constrainToSuperviewMargins()
  }
  
}

extension ExerciseComponentStackView: UITextFieldDelegate {
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    textChangedBlock(textField.text)
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
  
  public var weightChangedBlock: ((String?) -> Void) {
    set { weightStackView.textChangedBlock = newValue }
    get { return weightStackView.textChangedBlock }
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
    weightStackView.isEditable = true
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
