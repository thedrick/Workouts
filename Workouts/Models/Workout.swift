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
