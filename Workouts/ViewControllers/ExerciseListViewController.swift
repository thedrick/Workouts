//
//  ExerciseListViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/22/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

final class ExerciseListViewController: UITableViewController {
  
  init() {
    super.init(style: .grouped)
    title = "Exercises"
    tabBarItem.image = UIImage.fontAwesomeIcon(
      name: FontAwesome.barChart,
      textColor: Colors.primaryColor,
      size: CGSize(width: 30, height: 30))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return workouts.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return workouts[section].exercises.count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return workouts[section].name
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = workouts[indexPath.section].exercises[indexPath.row].exercise.name
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let exercise = workouts[indexPath.section].exercises[indexPath.row]
    let detailVC = ExerciseWeightHistogramViewController(exercise: exercise.exercise)
    self.navigationController?.pushViewController(detailVC, animated: true)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // MARK: Private
  
  private let workouts = WorkoutBuilder.workoutWeek
  
}
