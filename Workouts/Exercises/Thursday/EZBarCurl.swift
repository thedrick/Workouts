//
//  EZBarCurl.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct EZBarCurl: Exercise {
  var name: String {
    return "EZ-Bar Curl"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/210/Male/m/210_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/210/Male/m/210_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Stand up straight while holding an EZ curl bar at the wide outer handle. The palms of your hands should be facing forward and slightly tilted inward due to the shape of the bar. Keep your elbows close to your torso. This will be your starting position.
    
    2. Now, while keeping your upper arms stationary, exhale and curl the weights forward while contracting the biceps. Focus on only moving your forearms.
    
    3. Continue to raise the weight until your biceps are fully contracted and the bar is at shoulder level. Hold the top contracted position for a moment and squeeze the biceps.
    
    4. Then inhale and slowly lower the bar back to the starting position.
    
    5. Repeat for the recommended amount of repetitions.
    
    Variations: You can also perform this movement using an E-Z attachment hooked to a low pulley. This variation seems to really provide a good contraction at the top of the movement.
    
    You may also use the closer grip for variety purposes.
    """
  }
}

struct ConcreteEZBarCurl: ConcreteExercise {
  var exercise: Exercise {
    return EZBarCurl()
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
