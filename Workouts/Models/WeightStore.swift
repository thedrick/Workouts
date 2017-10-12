//
//  WeightStore.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation

struct WeightStore {
  
  static var shared = WeightStore()
  
  func weightForWorkout(_ name: String) -> Int {
    return UserDefaults.standard.integer(forKey: name)
  }
  
  func setWeight(_ weight: Int, forName name: String) {
    UserDefaults.standard.set(weight, forKey: name)
  }
  
}
