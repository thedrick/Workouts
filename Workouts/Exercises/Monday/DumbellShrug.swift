//
//  DumbellShrug.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct DumbellShrug: Exercise {
  var name: String {
    return "Dumbell Shrugs"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/96/Male/m/96_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/96/Male/m/96_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Stand erect with a dumbbell on each hand (palms facing your torso), arms extended on the sides.
    
    2. Lift the dumbbells by elevating the shoulders as high as possible while you exhale. Hold the contraction at the top for a second. Tip: The arms should remain extended at all times. Refrain from using the biceps to help lift the dumbbells. Only the shoulders should be moving up and down.
    
    3. Lower the dumbbells back to the original position.
    
    4. Repeat for the recommended amount of repetitions.
    
    Variations: You can perform this exercise with bands, barbells or cables. You can also use a single handle and work one side at a time.
    """
  }
}

struct ConcreteDumbellShrug: ConcreteExercise {
  var exercise: Exercise {
    return DumbellShrug()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
