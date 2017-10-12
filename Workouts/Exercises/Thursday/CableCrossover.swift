//
//  CableCrossover.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct CableCrossover: Exercise {
  var name: String {
    return "Cable Crossover"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/132/Male/m/132_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/132/Male/m/132_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. To get yourself into the starting position, place the pulleys on a high position (above your head), select the resistance to be used and hold the pulleys in each hand.
    
    2. Step forward in front of an imaginary straight line between both pulleys while pulling your arms together in front of you. Your torso should have a small forward bend from the waist. This will be your starting position.
    
    3. With a slight bend on your elbows in order to prevent stress at the biceps tendon, extend your arms to the side (straight out at both sides) in a wide arc until you feel a stretch on your chest. Breathe in as you perform this portion of the movement. Tip: Keep in mind that throughout the movement, the arms and torso should remain stationary; the movement should only occur at the shoulder joint.
    
    4. Return your arms back to the starting position as you breathe out. Make sure to use the same arc of motion used to lower the weights.
    
    5. Hold for a second at the starting position and repeat the movement for the prescribed amount of repetitions.
    
    Variations: You can vary the point in front of you where your arms meet.
    """
  }
}

struct ConcreteCableCrossover: ConcreteExercise {
  var exercise: Exercise {
    return CableCrossover()
  }
  
  var setCount: Int {
    return 3
  }
  
  var repCount: Int {
    return 10
  }
  
  var startingWeight: Int {
    return 20
  }
}
