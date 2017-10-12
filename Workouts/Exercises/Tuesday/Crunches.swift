//
//  Crunches.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/9/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct Crunches: Exercise {
  var name: String {
    return "Crunches"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/102/Male/m/102_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/102/Male/m/102_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Lie flat on your back with your feet flat on the ground, or resting on a bench with your knees bent at a 90 degree angle. If you are resting your feet on a bench, place them three to four inches apart and point your toes inward so they touch.
    
    2. Now place your hands lightly on either side of your head keeping your elbows in. Tip: Don't lock your fingers behind your head.
    
    3. While pushing the small of your back down in the floor to better isolate your abdominal muscles, begin to roll your shoulders off the floor.
    
    4. Continue to push down as hard as you can with your lower back as you contract your abdominals and exhale. Your shoulders should come up off the floor only about four inches, and your lower back should remain on the floor. At the top of the movement, contract your abdominals hard and keep the contraction for a second. Tip: Focus on slow, controlled movement - don't cheat yourself by using momentum.
    
    5. After the one second contraction, begin to come down slowly again to the starting position as you inhale.
    
    6. Repeat for the recommended amount of repetitions.
    
    Variations: There are many variations for the crunch. You can perform the exercise with weights, or on top of an exercise ball or on a decline bench.
    """
  }
}

struct ConcreteCrunches: ConcreteExercise {
  var exercise: Exercise {
    return Crunches()
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

