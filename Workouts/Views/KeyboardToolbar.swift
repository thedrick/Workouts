//
//  KeyboardToolbar.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/22/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

final class KeyboardToolbar: UIToolbar {
  
  init(responder: UIResponder) {
    self.responder = responder
    super.init(frame: .zero)
    doneButton = UIBarButtonItem(
      barButtonSystemItem: .done,
      target: self,
      action: #selector(doneTapped))
    let spacer = UIBarButtonItem(
      barButtonSystemItem: .flexibleSpace,
      target: nil,
      action: nil)
    setItems([spacer, doneButton], animated: false)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private var doneButton: UIBarButtonItem!
  private weak var responder: UIResponder?
  
  @objc private func doneTapped() {
    responder?.resignFirstResponder()
  }
  
}
