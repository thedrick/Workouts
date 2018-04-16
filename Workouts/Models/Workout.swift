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

struct StoredWorkout: Codable, Equatable {
  var name: String
  var storedExercises: [StoredExercise]
  var completedAt: Date
}

struct StoredExercise: Codable, Equatable {
  var name: String
  var setCount: Int
  var repCount: Int
  var weight: Int
  var weightSetAt: Date
  var isComplete: Bool?
}
