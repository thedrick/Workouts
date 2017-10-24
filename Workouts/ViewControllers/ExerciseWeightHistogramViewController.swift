//
//  ExerciseWeightHistogramViewController.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/22/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

import SwiftChart

final class ExerciseWeightHistogramViewController: UIViewController {
  
  init(exercise: Exercise) {
    self.exercise = exercise
    super.init(nibName: nil, bundle: nil)
    title = exercise.name
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
    setupConstraints()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.delegate = self
    tableView.dataSource = self
    loadData()
  }
  
  // MARK: Private
  
  private let exercise: Exercise
  private let chartView = Chart()
  private let tableView = UITableView()
  
  fileprivate var storedExercises = [StoredExercise]()
  fileprivate lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    return formatter
  }()
  
  private func setupViews() {
    [tableView, chartView].forEach { v in
      v.translatesAutoresizingMaskIntoConstraints = false
    }
    view.addSubview(chartView)
    view.addSubview(tableView)
    tableView.tableFooterView = UIView()
  }
  
  private func setupConstraints() {
    chartView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    chartView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
    chartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    chartView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: chartView.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  private func loadData() {
    guard let workouts = WorkoutStorage.shared.getWorkouts() else { return }
    let exercises = workouts.map { workout in
      return workout.storedExercises.filter { return $0.name == exercise.name }
    }
    storedExercises = exercises.flatMap { $0 }
    guard storedExercises.count > 0 else { return }
    
    tableView.reloadData()
    
    let chartData = storedExercises.map { return Float($0.weight) }
    let chartSeries = ChartSeries(chartData)
    chartSeries.color = Colors.primaryColor
    chartSeries.area = true
    chartView.minY = 0
    chartView.maxX = Float(storedExercises.count)
    chartView.maxY = Float(storedExercises.reduce(0, { res, exercise in
      return max(res, exercise.weight)
    }))
    chartView.xLabelsSkipLast = false
    chartView.series = [chartSeries]
  }
  
}

extension ExerciseWeightHistogramViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return storedExercises.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let exercise = storedExercises[indexPath.row]
    cell.textLabel?.text = "\(dateFormatter.string(from: exercise.weightSetAt)) – \(exercise.weight)"
    return cell
  }
  
}
