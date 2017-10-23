//
//  LegExtensions.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/9/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct LegExtensions: Exercise {
  var name: String {
    return "Leg Extensions"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/53/Male/m/53_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/53/Male/m/53_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. For this exercise you will need to use a leg extension machine. First choose your weight and sit on the machine with your legs under the pad (feet pointed forward) and the hands holding the side bars. This will be your starting position. Tip: You will need to adjust the pad so that it falls on top of your lower leg (just above your feet). Also, make sure that your legs form a 90-degree angle between the lower and upper leg. If the angle is less than 90-degrees then that means the knee is over the toes which in turn creates undue stress at the knee joint. If the machine is designed that way, either look for another machine or just make sure that when you start executing the exercise you stop going down once you hit the 90-degree angle.
    
    2. Using your quadriceps, extend your legs to the maximum as you exhale. Ensure that the rest of the body remains stationary on the seat. Pause a second on the contracted position.
    
    3. Slowly lower the weight back to the original position as you inhale, ensuring that you do not go past the 90-degree angle limit.
    
    4. Repeat for the recommended amount of times.
    
    Variations: As mentioned at in the foot positioning section, you can use various foot positions in order to maximize stimulation of certain thigh areas. Also, you can perform the movement unilaterally (one leg at a time).
    """
  }
}

struct ConcreteLegExtensions: ConcreteExercise {
  var exercise: Exercise {
    return LegExtensions()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}

