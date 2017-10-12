//
//  WorkoutListViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

class WorkoutListViewController: UITableViewController {
  
  init() {
    workouts = WorkoutBuilder.workoutWeek
    super.init(style: .plain)
    self.title = "Workouts"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 80
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.tableFooterView = UIView(frame: .zero)
    tableView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return workouts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let workout = workouts[indexPath.row]
    cell.textLabel?.text = workout.name
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let workout = workouts[indexPath.row]
    let detailVC = WorkoutViewController(workout: workout)
    navigationController?.pushViewController(detailVC, animated: true)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // MARK: Private
  
  private let workouts: [Workout]
  
}
