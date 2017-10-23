//
//  DipsChest.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct DipsChest: Exercise {
  var name: String {
    return "Dips - Chest Version"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/145/Male/m/145_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/145/Male/m/145_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. For this exercise you will need access to parallel bars. To get yourself into the starting position, hold your body at arms length (arms locked) above the bars.
    
    2. While breathing in, lower yourself slowly with your torso leaning forward around 30 degrees or so and your elbows flared out slightly until you feel a slight stretch in the chest.
    
    3. Once you feel the stretch, use your chest to bring your body back to the starting position as you breathe out. Tip: Remember to squeeze the chest at the top of the movement for a second.
    
    4. Repeat the movement for the prescribed amount of repetitions.
    
    Variations:
    
    If you are new at this exercise and do not have the strength to perform it, use a dip assist machine if available. These machines use weight to help you push your bodyweight.
    
    Otherwise, a spotter holding your legs can help.
    
    More advanced lifters can add weight to the exercise by using a weight belt that allows the addition of weighted plates.
    """
  }
}

struct ConcreteDipsChest: ConcreteExercise {
  var exercise: Exercise {
    return DipsChest()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
