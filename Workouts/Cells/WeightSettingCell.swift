//
//  WeightSettingCell.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

final class WeightSettingCell: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUpViews()
    setUpConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var textDidChangeBlock: (String) -> Void = { _ in }
  
  public var workoutName: String? {
    set { label.text = newValue }
    get { return label.text }
  }
  
  public var weight: String? {
    set { textField.text = newValue }
    get { return textField.text }
  }
  
  public func startEditing() {
    textField.becomeFirstResponder()
  }
  
  private func setUpViews() {
    textField.translatesAutoresizingMaskIntoConstraints = false
    label.translatesAutoresizingMaskIntoConstraints = false
    
    textField.keyboardType = .numberPad
    textField.addTarget(
      self,
      action: #selector(textDidChange(_:)),
      for: .editingChanged)
    textField.delegate = self
    
    addSubview(label)
    addSubview(textField)
  }
  
  private func setUpConstraints() {
    label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
    label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    
    textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
    textField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
    textField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
  }
  
  private let label = UILabel()
  private let textField = UITextField()
  
  @objc private func textDidChange(_ textField: UITextField) {
    textDidChangeBlock(textField.text ?? "0")
  }
  
}

extension WeightSettingCell: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    if textField.text == "0" {
      textField.text = ""
    }
  }
  
}
