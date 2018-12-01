//
//  TableViewCell.swift
//  Workouts
//
//  Created by Tyler Hedrick on 4/17/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var view: UIView? {
    willSet {
      view?.removeFromSuperview()
    }
    didSet {
      contentView.addSubview(view!)
      setUpConstraints()
    }
  }
  
  // MARK: Private
  
  private func setUpConstraints() {
    view?.constrainToSuperview()
  }
  
}
