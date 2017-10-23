//
//  SideLateralRaise.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct SideLateralRaise: Exercise {
  var name: String {
    return "Side Lateral Raise"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/373/Male/m/373_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/373/Male/m/373_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Pick a couple of dumbbells and stand with a straight torso and the dumbbells by your side at arms length with the palms of the hand facing you. This will be your starting position.
    
    2. While maintaining the torso in a stationary position (no swinging), lift the dumbbells to your side with a slight bend on the elbow and the hands slightly tilted forward as if pouring water in a glass. Continue to go up until you arms are parallel to the floor. Exhale as you execute this movement and pause for a second at the top.
    
    3. Lower the dumbbells back down slowly to the starting position as you inhale.
    
    4. Repeat for the recommended amount of repetitions.
    
    Variation: This exercise can also be performed sitting down.
    """
  }
}

struct ConcreteSideLateralRaise: ConcreteExercise {
  var exercise: Exercise {
    return SideLateralRaise()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
