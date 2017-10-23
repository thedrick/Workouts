//
//  FridayFridayStandingCalfRaises.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/12/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct ConcreteFridayStandingCalfRaises: ConcreteExercise {
  var exercise: Exercise {
    return StandingCalfRaises()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }
}

