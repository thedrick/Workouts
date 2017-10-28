//
//  IncompleteWorkoutStorage.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/26/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Disk
import Foundation

let filePath = "partialWorkout.json"

final class IncompleteWorkoutStorage {
  
  static var shared = IncompleteWorkoutStorage()
  
  static var workoutForIncompleteWorkout: Workout? {
    if let partialWorkout = IncompleteWorkoutStorage.shared.loadPartialWorkout() {
      return WorkoutBuilder.workoutWeek.first(where: { return $0.name == partialWorkout.name })
    }
    return nil
  }
  
  func savePartialWorkout(_ workout: StoredWorkout) {
    do {
      try Disk.save(workout, to: .documents, as: filePath)
    } catch {
      print("Error saving partial workout \(error)")
    }
  }
  
  func loadPartialWorkout() -> StoredWorkout? {
    do {
      return try Disk.retrieve(filePath, from: .documents, as: StoredWorkout.self)
    } catch {
      print("Error loading partial workout \(error)")
      return nil
    }
  }
  
  func deletePartialWorkout() {
    do {
      try Disk.remove(filePath, from: .documents)
    } catch {
      print("Error deleting partial workout \(error)")
    }
  }
  
}
