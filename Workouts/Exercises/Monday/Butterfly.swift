//
//  Butterfly.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct Butterfly: Exercise {
  var name: String {
    return "Butterfly"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/214/Male/m/214_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/214/Male/m/214_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Sit on the machine with your back flat on the pad.
    
    2.Take hold of the handles. Tip: Your upper arms should be positioned parallel to the floor; adjust the machine accordingly. This will be your starting position.
    
    3. Push the handles together slowly as you squeeze your chest in the middle. Breathe out during this part of the motion and hold the contraction for a second.
    
    4. Return back to the starting position slowly as you inhale until your chest muscles are fully stretched.
    Repeat for the recommended amount of repetitions.
    """
  }
}

struct ConcreteButterfly: ConcreteExercise {
  var exercise: Exercise {
    return Butterfly()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
