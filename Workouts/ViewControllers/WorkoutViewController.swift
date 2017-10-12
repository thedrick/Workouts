//
//  ViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

class WorkoutViewController: UITableViewController {
  
  init(workout: Workout, tabTitle: String? = nil) {
    self.workout = workout
    super.init(style: .grouped)
    self.title = tabTitle
    self.navigationItem.title = workout.name
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Weights",
      style: .plain,
      target: self,
      action: #selector(settingsTapped))
    
    tableView.register(ExerciseRow.self, forCellReuseIdentifier: "cell")
    buildSections()
    tableView.rowHeight = 72
    tableView.reloadData()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    tableView.reloadData()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].numberOfCells
  }

  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let sectionModel = sections[section]
    let view = WorkoutSectionHeader()
    view.title = sectionModel.title
    let exercise = workout.exercises[section]
    view.didTapBlock = { [weak self] _ in
      self?.navigateToExerciseDetail(exercise.exercise)
    }
    return view
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseRow
    let section = sections[indexPath.section]
    let cellModel = section.cellModelForIndex(idx: indexPath.row)
    let weight = WeightStore.shared.weightForWorkout(cellModel.exercise.exercise.name)
    cell.number = indexPath.row + 1
    cell.repCount = String(cellModel.exercise.repCount)
    cell.weight = String(weight)
    cell.isComplete = cellModel.isComplete
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! ExerciseRow
    cell.toggleComplete()
    let section = sections[indexPath.section]
    sections[indexPath.section] = section.setIsComplete(cell.isComplete, atIndex: indexPath.row)
    tableView.deselectRow(at: indexPath, animated: false)
  }
  
  // MARK: Private
  
  let workout: Workout
  var sections = [ExerciseSection]()
  
  func buildSections() {
    sections = workout.exercises.map { exercise in
      return ExerciseSectionBuilder.emptySection(with: exercise)
    }
  }
  
  func navigateToExerciseDetail(_ exercise: Exercise) {
    let detailVC = ExerciseDetailViewController(exercise: exercise)
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  @objc private func settingsTapped() {
    let vc = SettingsViewController(workout: workout)
    let nav = UINavigationController(rootViewController: vc)
    present(nav, animated: true, completion: nil)
  }

}

