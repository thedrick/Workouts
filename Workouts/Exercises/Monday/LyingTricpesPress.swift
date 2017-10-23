//
//  LyingTricpesPress.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct LyingTricepsPress: Exercise {
  var name: String {
    return "Lying Triceps Press"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/342/Male/m/342_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/342/Male/m/342_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Lie on a flat bench with either an e-z bar (my preference) or a straight bar placed on the floor behind your head and your feet on the floor.
    
    2. Grab the bar behind you, using a medium overhand (pronated) grip, and raise the bar in front of you at arms length. Tip: The arms should be perpendicular to the torso and the floor. The elbows should be tucked in. This is the starting position.
    
    3. As you breathe in, slowly lower the weight until the bar lightly touches your forehead while keeping the upper arms and elbows stationary.
    
    4. At that point, use the triceps to bring the weight back up to the starting position as you breathe out.
    
    5. Repeat for the recommended amount of repetitions.
    
    Caution: This is an exercise that you need to be very careful with when selecting the weight. Also, if you suffer from elbow problems this exercise might be too harsh on your elbows, so you may need to look for a substitute.
    """
  }
}

struct ConcreteLyingTricepsPress: ConcreteExercise {
  var exercise: Exercise {
    return LyingTricepsPress()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
