//
//  LegPress.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/9/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct LegPress: Exercise {
  var name: String {
    return "LegPress"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/57/Male/m/57_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/57/Male/m/57_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Using a leg press machine, sit down on the machine and place your legs on the platform directly in front of you at a medium (shoulder width) foot stance. (Note: For the purposes of this discussion we will use the medium stance described above which targets overall development; however you can choose any of the three stances described in the foot positioning section).
    
    2. Lower the safety bars holding the weighted platform in place and press the platform all the way up until your legs are fully extended in front of you. Tip: Make sure that you do not lock your knees. Your torso and the legs should make a perfect 90-degree angle. This will be your starting position.
    
    3. As you inhale, slowly lower the platform until your upper and lower legs make a 90-degree angle.
    
    4. Pushing mainly with the heels of your feet and using the quadriceps go back to the starting position as you exhale.
    
    5. Repeat for the recommended amount of repetitions and ensure to lock the safety pins properly once you are done. You do not want that platform falling on you fully loaded.
    """
  }
}

struct ConcreteLegPress: ConcreteExercise {
  var exercise: Exercise {
    return LegPress()
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
