//
//  StandingMilitaryPress.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct StandingMilitaryPress: Exercise {
  var name: String {
    return "Standing Military Press"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/370/Male/m/370_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/370/Male/m/370_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Start by placing a barbell that is about chest high on a squat rack. Once you have selected the weights, grab the barbell using a pronated (palms facing forward) grip. Make sure to grip the bar wider than shoulder width apart from each other.
    
    2. Slightly bend the knees and place the barbell on your collar bone. Lift the barbell up keeping it lying on your chest. Take a step back and position your feet shoulder width apart from each other.
    
    3. Once you pick up the barbell with the correct grip length, lift the bar up over your head by locking your arms. Hold at about shoulder level and slightly in front of your head. This is your starting position.
    
    4. Lower the bar down to the collarbone slowly as you inhale.
    
    5. Lift the bar back up to the starting position as you exhale.
    
    6. Repeat for the recommended amount of repetitions.
    """
  }
}

struct ConcreteStandingMilitaryPress: ConcreteExercise {
  var exercise: Exercise {
    return StandingMilitaryPress()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
