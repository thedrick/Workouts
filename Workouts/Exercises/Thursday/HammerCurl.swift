//
//  HammerCurl.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct HammerCurl: Exercise {
  var name: String {
    return "Hammer Curl"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/147/Male/m/147_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/147/Male/m/147_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Stand up with your torso upright and a dumbbell on each hand being held at arms length. The elbows should be close to the torso.
    
    2. The palms of the hands should be facing your torso. This will be your starting position.
    
    3. Now, while holding your upper arm stationary, exhale and curl the weight forward while contracting the biceps. Continue to raise the weight until the biceps are fully contracted and the dumbbell is at shoulder level. Hold the contracted position for a brief moment as you squeeze the biceps. Tip: Focus on keeping the elbow stationary and only moving your forearm.
    
    4. After the brief pause, inhale and slowly begin the lower the dumbbells back down to the starting position.
    
    5. Repeat for the recommended amount of repetitions.
    
    Variations: There are many possible variations for this movement. For instance, you can perform the exercise sitting down on a bench with or without back support and you can also perform it by alternating arms; first lift the right arm for one repetition, then the left, then the right, etc.
    """
  }
}

struct ConcreteHammerCurl: ConcreteExercise {
  var exercise: Exercise {
    return HammerCurl()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
