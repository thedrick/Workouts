//
//  WorkoutStorage.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/22/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import Disk

let historyFilePath = "workout.history.json"

struct WorkoutStorage {
  
  static var shared = WorkoutStorage()
  
  func saveWorkout(_ workout: StoredWorkout) {
    // Update stored weight information for each exercise
    workout.storedExercises.forEach { exercise in
      WeightStore.shared.setWeight(exercise.weight, forName: exercise.name)
    }
    do {
      if !Disk.exists(historyFilePath, in: .documents) {
        try Disk.save([workout], to: .documents, as: historyFilePath)
      } else {
        try Disk.append(workout, to: historyFilePath, in: .documents)
      }
    } catch {
      print("Error saving workout \(error)")
    }
  }
  
  func getWorkouts() -> [StoredWorkout]? {
    do {
      return try Disk.retrieve(historyFilePath, from: .documents, as: [StoredWorkout].self)
    } catch {
      print("Error getting workouts \(error)")
      return []
    }
  }
  
  func removeWorkout(_ workout: StoredWorkout) {
    do {
      if var workouts = getWorkouts(), let index = workouts.index(of: workout) {
        workouts.remove(at: index)
        try Disk.save(workouts, to: .documents, as: historyFilePath)
      }
    } catch {
      print("Error deleting workout \(error)")
    }
  }
  
}
