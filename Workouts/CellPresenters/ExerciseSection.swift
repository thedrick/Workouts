//
//  ExerciseCellModel.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation

struct ExerciseSection {
  let title: String
  let cellModels: [ExerciseCellModel]
  
  var numberOfCells: Int {
    return cellModels.count
  }
  
  func cellModelForIndex(idx: Int) -> ExerciseCellModel {
    return cellModels[idx]
  }
  
  func setIsComplete(_ isComplete: Bool, atIndex idx: Int) -> ExerciseSection {
    var models = cellModels
    let oldModel = cellModels[idx]
    let updatedModel = ExerciseCellModel(
      exercise: oldModel.exercise,
      isComplete: isComplete)
    models[idx] = updatedModel
    return ExerciseSection(
      title: title,
      cellModels: models)
  }
}

struct ExerciseCellModel {
  let exercise: ConcreteExercise
  var isComplete: Bool
}

struct ExerciseSectionBuilder {
  
  static func emptySection(with exercise: ConcreteExercise) -> ExerciseSection {
    return ExerciseSection(
      title: exercise.exercise.name,
      cellModels: cellModels(with: exercise))
  }
  
  private static func cellModels(with exercise: ConcreteExercise) -> [ExerciseCellModel] {
    var models = [ExerciseCellModel]()
    for _ in 1...exercise.setCount {
      models.append(ExerciseCellModel(exercise: exercise, isComplete: false))
    }
    return models
  }
  
}
