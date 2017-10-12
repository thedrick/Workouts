//
//  PreacherCurl.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct PreacherCurl: Exercise {
  var name: String {
    return "Preacher Curl"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/180/Male/m/180_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/180/Male/m/180_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. To perform this movement you will need a preacher bench and an E-Z bar. Grab the E-Z curl bar at the close inner handle (either have someone hand you the bar which is preferable or grab the bar from the front bar rest provided by most preacher benches). The palm of your hands should be facing forward and they should be slightly tilted inwards due to the shape of the bar.
    
    2. With the upper arms positioned against the preacher bench pad and the chest against it, hold the E-Z Curl Bar at shoulder length. This will be your starting position.
    
    3. As you breathe in, slowly lower the bar until your upper arm is extended and the biceps is fully stretched.
    
    4. As you exhale, use the biceps to curl the weight up until your biceps is fully contracted and the bar is at shoulder height. Squeeze the biceps hard and hold this position for a second.
    
    5. Repeat for the recommended amount of repetitions.
    
    Variations: You can perform this exercise also using a low pulley with an E-Z Bar attachment instead. In this case you will need to position the bench in front of the pulley. You may also use a wider grip for variety purposes.
    """
  }
}

struct ConcretePreacherCurl: ConcreteExercise {
  var exercise: Exercise {
    return PreacherCurl()
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
