//
//  WorkoutHistoryViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/22/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

final class WorkoutHistoryViewController: UITableViewController {
  
  init(workout: StoredWorkout) {
    self.workout = workout
    super.init(style: .grouped)
    title = dateFormatter.string(from: workout.completedAt)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(ExerciseRow.self, forCellReuseIdentifier: "cell")
    tableView.rowHeight = 72
    buildSections()
    tableView.reloadData()
  }
  
  // MARK: UITableView
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseRow
    let exercise = sections[indexPath.section][indexPath.row]
    cell.weight = String(exercise.weight)
    cell.repCount = String(exercise.repCount)
    cell.number = indexPath.row + 1
    cell.isUserInteractionEnabled = false
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let section = sections[section]
    let view = WorkoutSectionHeader()
    view.title = section.first!.name
    return view
  }
  
  // MARK: Private
  
  private let workout: StoredWorkout
  private var sections = [[StoredExercise]]()
  private lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "E, MMM d"
    return formatter
  }()
  
  // lol this is so ugly
  private func buildSections() {
    sections = workout.storedExercises.reduce([[]], { result, exercise in
      if var current = result.last {
        if let currentExercise = current.last {
          if currentExercise.name == exercise.name {
            current.append(exercise)
            var mutatedResult = result
            mutatedResult.removeLast()
            mutatedResult.append(current)
            return mutatedResult
          } else {
            var mutatedResult = result
            mutatedResult.append([exercise])
            return mutatedResult
          }
        } else {
          current.append(exercise)
          var mutatedResult = result
          mutatedResult.removeLast()
          mutatedResult.append(current)
          return mutatedResult
        }
      }
      return [[exercise]]
    })
  }
  
}
