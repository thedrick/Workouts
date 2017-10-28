//
//  WorkoutListViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/22/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

struct WorkoutStartItem {
  var title: String
  var workout: Workout?
  
  static var newWorkout: WorkoutStartItem {
    return WorkoutStartItem(title: "Start a new workout", workout: nil)
  }
  
  static var todayWorkout: WorkoutStartItem? {
    guard let todayWorkout = WorkoutBuilder.todayWorkout else { return nil }
    return WorkoutStartItem(
      title: "Start workout: \(todayWorkout.name)",
      workout: todayWorkout)
  }
  
  static func resumeItemWithWorkout(_ workout: Workout) -> WorkoutStartItem {
    return WorkoutStartItem(
      title: "Resume workout: \(workout.name)",
      workout: workout)
  }
}

struct WorkoutHistoryItem {
  var workout: StoredWorkout
}

final class WorkoutListViewController: UITableViewController {
  
  init() {
    workoutStartItems = []
    workoutHistoryItems = []
    
    super.init(style: .grouped)
    
    loadWorkouts()
    refreshStartItems()
    
    title = "Workouts"
    tabBarItem.image = UIImage.fontAwesomeIcon(
      name: FontAwesome.list,
      textColor: Colors.primaryColor,
      size: CGSize(width: 30, height: 30))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.register(WorkoutHistoryCell.self, forCellReuseIdentifier: "historyCell")
    if let incompleteWorkout = IncompleteWorkoutStorage.workoutForIncompleteWorkout {
      showWorkoutViewController(with: incompleteWorkout)
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    loadWorkouts()
    refreshStartItems()
    tableView.reloadData()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0: return "Start a workout"
    case 1: return "Workout history"
    default: return nil
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0: return workoutStartItems.count
    case 1: return workoutHistoryItems.count
    default: return 0
    }
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return indexPath.section == 1
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      WorkoutStorage.shared.removeWorkout(workoutHistoryItems[indexPath.row].workout)
      workoutHistoryItems.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      configureCell(cell, withStartItem: workoutStartItems[indexPath.row])
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! WorkoutHistoryCell
      configureCell(cell, withHistoryItem: workoutHistoryItems[indexPath.row])
      return cell
    default:
      break
    }
    return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case 0: handleSelection(workoutStartItems[indexPath.row])
    case 1: handleSelection(workoutHistoryItems[indexPath.row])
    default: break
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // MARK: Private
  
  private var workoutStartItems: [WorkoutStartItem]
  private var workoutHistoryItems: [WorkoutHistoryItem]
  private lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM d"
    return formatter
  }()
  
  private func configureCell(_ cell: UITableViewCell, withStartItem item: WorkoutStartItem) {
    cell.textLabel?.text = item.title
  }
  
  private func configureCell(_ cell: WorkoutHistoryCell, withHistoryItem item: WorkoutHistoryItem) {
    cell.supertitle = item.workout.name
    cell.title = dateFormatter.string(from: item.workout.completedAt)
  }
  
  private func handleSelection(_ startItem: WorkoutStartItem) {
    if let workout = startItem.workout {
      showWorkoutViewController(with: workout)
      return
    }
    let actionSheet = UIAlertController(
      title: "Start a workout",
      message: nil,
      preferredStyle: .actionSheet)
    actionSheet.addAction(UIAlertAction(
      title: "Cancel",
      style: .cancel,
      handler: nil))
    WorkoutBuilder.workoutWeek.forEach { workout in
      actionSheet.addAction(UIAlertAction(
        title: workout.name,
        style: .default,
        handler: { [weak self] _ in
          self?.showWorkoutViewController(with: workout)
      }))
    }
    present(actionSheet, animated: true, completion: nil)
  }
  
  private func handleSelection(_ historyItem: WorkoutHistoryItem) {
    let detailVC = WorkoutHistoryViewController(workout: historyItem.workout)
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  private func showWorkoutViewController(with workout: Workout) {
    let workoutVC = WorkoutViewController(workout: workout)
    let navVC = UINavigationController(rootViewController: workoutVC)
    present(navVC, animated: true, completion: nil)
  }
  
  private func loadWorkouts() {
    if let workoutHistory = WorkoutStorage.shared.getWorkouts()?.reversed() {
      workoutHistoryItems = workoutHistory.map { workout in
        return WorkoutHistoryItem(workout: workout)
      }
    } else {
      workoutHistoryItems = []
    }
  }
  
  private func refreshStartItems() {
    var items = [ WorkoutStartItem.newWorkout ]
    if let todayItem = WorkoutStartItem.todayWorkout {
      items.append(todayItem)
    }
    if let incompleteWorkout = IncompleteWorkoutStorage.workoutForIncompleteWorkout {
      items.append(WorkoutStartItem.resumeItemWithWorkout(incompleteWorkout))
    }
    workoutStartItems = items
  }
  
}
