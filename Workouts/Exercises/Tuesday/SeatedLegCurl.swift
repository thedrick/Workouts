//
//  SeatedLegCurl.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/9/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct SeatedLegCurl: Exercise {
  var name: String {
    return "SeatedLegCurl"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/69/Male/m/69_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/69/Male/m/69_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Adjust the machine lever to fit your height and sit on the machine with your back against the back support pad.
    
    2. Place the back of lower leg on top of padded lever (just a few inches under the calves) and secure the lap pad against your thighs, just above the knees. Then grasp the side handles on the machine as you point your toes straight (or you can also use any of the other two stances) and ensure that the legs are fully straight right in front of you. This will be your starting position.
    
    3. As you exhale, pull the machine lever as far as possible to the back of your thighs by flexing at the knees. Keep your torso stationary at all times. Hold the contracted position for a second.
    
    4. Slowly return to the starting position as you breathe in.
    
    5. Repeat for the recommended amount of repetitions.
    
    Caution: Do not ever use so much weight on the exercise that you start using swinging and jerking as you can risk both lower back injury and also a hamstring tear.
    
    Variations: Since you have three foot positions you have in reality three exercises.
    """
  }
}

struct ConcreteSeatedLegCurl: ConcreteExercise {
  var exercise: Exercise {
    return SeatedLegCurl()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }
  
  var startingWeight: Int {
    return 20
  }
}

