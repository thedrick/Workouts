//
//  InclineDumbellPress.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct InclineDumbellPress: Exercise {
  var name: String {
    return "Incline Dumbell Press"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/380/Male/m/380_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/380/Male/m/380_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Lie back on an incline bench with a dumbbell in each hand atop your thighs. The palms of your hands will be facing each other.
    
    2. Then, using your thighs to help push the dumbbells up, lift the dumbbells one at a time so that you can hold them at shoulder width.
    
    3. Once you have the dumbbells raised to shoulder width, rotate your wrists forward so that the palms of your hands are facing away from you. This will be your starting position.
    
    4. Be sure to keep full control of the dumbbells at all times. Then breathe out and push the dumbbells up with your chest.
    
    5. Lock your arms at the top, hold for a second, and then start slowly lowering the weight. Tip Ideally, lowering the weights should take about twice as long as raising them.
    
    6. Repeat the movement for the prescribed amount of repetitions.
    
    7. When you are done, place the dumbbells back on your thighs and then on the floor. This is the safest manner to release the dumbbells.
    
    Variations: You can use several angles on the incline bench if the bench you are using is adjustable.
    
    Another variation of this exercise is to perform it with the palms of the hands facing each other.
    
    Also, you can perform the exercise with the palms facing each other and then twisting the wrist as you lift the dumbbells so that at the top of the movement the palms are facing away from the body. I personally do not use this variation very often as it seems to be hard on my shoulders.
    """
  }
}

struct ConcreteInclineDumbellPress: ConcreteExercise {
  var exercise: Exercise {
    return InclineDumbellPress()
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
