//
//  AbCrunchMachine.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/9/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct AbCrunchMachine: Exercise {
  var name: String {
    return "Ab Crunch Machine"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/225/Male/m/225_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/225/Male/m/225_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Select a light resistance and sit down on the ab machine placing your feet under the pads provided and grabbing the top handles. Your arms should be bent at a 90 degree angle as you rest the triceps on the pads provided. This will be your starting position.
    
    2. At the same time, begin to lift the legs up as you crunch your upper torso. Breathe out as you perform this movement. Tip: Be sure to use a slow and controlled motion. Concentrate on using your abs to move the weight while relaxing your legs and feet.
    
    3. After a second pause, slowly return to the starting position as you breathe in.
    
    4. Repeat the movement for the prescribed amount of repetitions.
    
    Caution: For this exercise, always select a weight that you can easily handle as using too much weight can easily lead to injury.
    """
  }
}

struct ConcreteAbCrunchMachine: ConcreteExercise {
  var exercise: Exercise {
    return AbCrunchMachine()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}

