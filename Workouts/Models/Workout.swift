//
//  Workout.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct Workout {
  let name: String
  let exercises: [ConcreteExercise]
}

protocol Exercise {
  var name: String { get }
  var images: [URL] { get }
  var description: String { get }
}

protocol ConcreteExercise {
  var exercise: Exercise { get }
  var setCount: Int { get }
  var repCount: Int { get }
  var startingWeight: Int { get }
}

extension ConcreteExercise {
  var startingWeight: Int {
    return WeightStore.shared.weightForWorkout(exercise.name)
  }
}

struct StoredWorkout: Codable {
  var name: String
  var storedExercises: [StoredExercise]
  var completedAt: Date
}

extension StoredWorkout: Equatable {
  static func ==(lhs: StoredWorkout, rhs: StoredWorkout) -> Bool {
    return lhs.name == rhs.name &&
      lhs.storedExercises == rhs.storedExercises &&
      lhs.completedAt == rhs.completedAt
  }
}

struct StoredExercise: Codable {
  var name: String
  var setCount: Int
  var repCount: Int
  var weight: Int
  var weightSetAt: Date
}

extension StoredExercise: Equatable {
  static func ==(lhs: StoredExercise, rhs: StoredExercise) -> Bool {
    return lhs.name == rhs.name &&
      lhs.setCount == rhs.setCount &&
      lhs.repCount == rhs.repCount &&
      lhs.weight == rhs.weight &&
      lhs.weightSetAt == rhs.weightSetAt
  }
}
