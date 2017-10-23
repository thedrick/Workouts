//
//  SeatedDumbellCurl.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct SeatedDumbellCurl: Exercise {
  var name: String {
    return "Seated Dumbell Curl"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/201/Male/m/201_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/201/Male/m/201_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Sit on a flat bench with a dumbbell on each hand being held at arms length. The elbows should be close to the torso.
    
    2. Rotate the palms of the hands so that they are facing your torso. This will be your starting position.
    
    3. While holding the upper arm stationary, curl the weights and start twisting the wrists once the dumbbells pass your thighs so that the palms of your hands face forward at the end of the movement. Make sure that you contract the biceps as you breathe out and make sure that only the forearms move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps.
    
    4. Slowly begin to bring the dumbbells back to the starting position as your breathe in and as you rotate the wrists back to a neutral grip.
    
    5. Repeat for the recommended amount of repetitions.
    """
  }
}

struct ConcreteSeatedDumbellCurl: ConcreteExercise {
  var exercise: Exercise {
    return SeatedDumbellCurl()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
