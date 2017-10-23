//
//  SettingsViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

  init() {
    self.workouts = WorkoutBuilder.workoutWeek
    super.init(style: .plain)
    title = "Manage Weights"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(WeightSettingCell.self, forCellReuseIdentifier: "cell")
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .done,
      target: self,
      action: #selector(doneTapped))
    tableView.rowHeight = 50
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return workouts.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return workouts[section].exercises.count
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    let cell = tableView.cellForRow(at: indexPath) as! WeightSettingCell
    cell.startEditing()
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeightSettingCell
    let exercise = workouts[indexPath.section].exercises[indexPath.row].exercise
    cell.workoutName = exercise.name
    cell.weight = String(WeightStore.shared.weightForWorkout(exercise.name))
    cell.textDidChangeBlock = { text in
      WeightStore.shared.setWeight(Int(text) ?? 0, forName: exercise.name)
    }
    return cell
  }
  
  private let workouts: [Workout]
  
  @objc private func doneTapped() {
    dismiss(animated: true, completion: nil)
  }
  
}
