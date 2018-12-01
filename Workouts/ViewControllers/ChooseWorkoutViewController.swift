//
//  ChooseWorkoutViewController.swift
//  Workouts
//
//  Created by tyler_hedrick on 4/15/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

final class ChooseWorkoutViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .clear
    setUpViews()
    setUpConstraints()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let tableViewContentHeight = tableView.contentSize.height
    var tableViewMaxHeight = view.bounds.height
    tableViewMaxHeight -= view.layoutMargins.top
    tableViewMaxHeight -= view.layoutMargins.bottom
    tableViewMaxHeight -= headerView.bounds.height
    tableViewHeightConstraint.constant = min(tableViewContentHeight, tableViewMaxHeight)
    tableView.isScrollEnabled = (tableViewContentHeight >= tableViewMaxHeight)
    containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
  }
  
  // MARK: Public
  
  public var didSelectWorkoutHandler: (Workout) -> Void = { _ in }

  // MARK: Private

  private lazy var containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 2)
    view.layer.shadowOpacity = 1
    view.layer.shadowRadius = 2
    return view
  }()
  private lazy var stackView: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.axis = .vertical
    view.spacing = 0
    view.distribution = .fill
    return view
  }()
  private lazy var headerView: ActionHeader = {
    let view = ActionHeader()
    view.leftButtonText = "Cancel"
    view.rightButtonText = "New"
    return view
  }()
  private lazy var backgroundButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(
      self,
      action: #selector(handleBackgroundTapped(_:)),
      for: .touchUpInside)
    return button
  }()
  private lazy var tableView: TableView = {
    let tableView = TableView()
    tableView.showsVerticalScrollIndicator = false
    tableView.showsHorizontalScrollIndicator = false
    return tableView
  }()
  private lazy var tableViewHeightConstraint: NSLayoutConstraint = {
    let constraint = tableView.heightAnchor.constraint(equalToConstant: 0)
    constraint.isActive = true
    return constraint
  }()

  private func setUpViews() {
    view.addSubview(backgroundButton)
    view.addSubview(containerView)
    containerView.addSubview(stackView)
    stackView.addArrangedSubview(headerView)
    stackView.addArrangedSubview(tableView)
    tableView.setSections(tableViewSections())
  }

  private func setUpConstraints() {
    backgroundButton.constrainToSuperview()
    view.layoutMargins = Margins.overlayContainer
    containerView.constrain(
      to: view,
      anchors: [.leadingMargin, .trailingMargin, .topMargin])
    stackView.constrainToSuperview()
  }

  @objc
  private func handleBackgroundTapped(_ button: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  private func tableViewSections() -> [TableViewSection] {
    let workouts = WorkoutBuilder.workoutWeek
    let rows: [TableViewRow] = workouts.map { workout in
      return TableViewRow(
        viewBuilder: { () -> UIView in
          let row = BasicRow()
          row.titleText = workout.name
          return row
      },
        selectionHandler: { [weak self] view in
          self?.didSelectWorkoutHandler(workout)
      })
    }
    
    return [TableViewSection(rows: rows)]
  }

}
