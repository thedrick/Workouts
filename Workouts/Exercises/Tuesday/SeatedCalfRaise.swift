//
//  SeatedCalfRaise.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/9/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct SeatedCalfRaise: Exercise {
  var name: String {
    return "SeatedCalfRaise"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/152/Male/m/152_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/152/Male/m/152_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Sit on the machine and place your toes on the lower portion of the platform provided with the heels extending off. Choose the toe positioning of your choice (forward, in, or out) as per the beginning of this chapter.
    
    2. Place your lower thighs under the lever pad, which will need to be adjusted according to the height of your thighs. Now place your hands on top of the lever pad in order to prevent it from slipping forward.
    
    3. Lift the lever slightly by pushing your heels up and release the safety bar. This will be your starting position.
    
    4. Slowly lower your heels by bending at the ankles until the calves are fully stretched. Inhale as you perform this movement.
    
    5. Raise the heels by extending the ankles as high as possible as you contract the calves and breathe out. Hold the top contraction for a second.
    
    6. Repeat for the recommended amount of repetitions.
    """
  }
}

struct ConcreteSeatedCalfRaise: ConcreteExercise {
  var exercise: Exercise {
    return SeatedCalfRaise()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }
  
  var startingWeight: Int {
    return 20
  }
}

