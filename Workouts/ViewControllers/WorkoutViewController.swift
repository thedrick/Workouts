//
//  ViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

class WorkoutViewController: UITableViewController {
  
  init(workout: Workout) {
    self.workout = workout
    super.init(style: .grouped)
    self.title = workout.name
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Cancel",
      style: .plain,
      target: self,
      action: #selector(cancelTapped))
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Finish",
      style: .done,
      target: self,
      action: #selector(finishTapped))
    
    tableView.register(ExerciseRow.self, forCellReuseIdentifier: "cell")
    tableView.keyboardDismissMode = .onDrag
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
    let weight = cellModel.weight
    cell.number = indexPath.row + 1
    cell.repCount = String(cellModel.exercise.repCount)
    cell.weight = String(weight)
    cell.isComplete = cellModel.isComplete
    cell.weightChangedBlock = { [weak self] weightString in
      guard let weightStr = weightString, let weight = Int(weightStr) else { return }
      // grab the section in the VC's ivar since they may have changed since the last time
      if let section = self?.sections[indexPath.section] {
        let newSection = section.setWeight(weight, atIndex: indexPath.row)
        self?.sections[indexPath.section] = newSection
      }
    }
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
  
  @objc private func cancelTapped() {
    let alert = UIAlertController(
      title: "Cancel workout?",
      message: "Are you sure you want to end this workout? Your progress will not be saved.",
      preferredStyle: .alert)
    alert.addAction(UIAlertAction(
      title: "Cancel",
      style: .cancel,
      handler: nil))
    alert.addAction(UIAlertAction(
      title: "End workout",
      style: .destructive,
      handler: { [weak self] _ in
        self?.dismiss(animated: true, completion: nil)
    }))
    present(alert, animated: true, completion: nil)
  }
  
  @objc private func finishTapped() {
    let alert = UIAlertController(
      title: "Finished workout",
      message: "Are you finished with your workout?",
      preferredStyle: .alert)
    alert.addAction(UIAlertAction(
      title: "Cancel",
      style: .cancel,
      handler: nil))
    alert.addAction(UIAlertAction(
      title: "Done",
      style: .default,
      handler: { [weak self] _ in
        self?.finishWorkout()
    }))
    present(alert, animated: true, completion: nil)
  }
  
  private func finishWorkout() {
    let today = Date()
    let storedExercises = sections.map { section in
      return section.cellModels.map { model in
        return StoredExercise(
          name: model.exercise.exercise.name,
          setCount: model.exercise.setCount,
          repCount: model.exercise.repCount,
          weight: model.weight,
          weightSetAt: today)
      }
    }.flatMap { $0 }
    let storedWorkout = StoredWorkout(
      name: workout.name,
      storedExercises: storedExercises,
      completedAt: today)
    WorkoutStorage.shared.saveWorkout(storedWorkout)
    dismiss(animated: true, completion: nil)
  }

}

