//
//  UprightCableRow.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct UprightCableRow: Exercise {
  var name: String {
    return "Upright Cable Row"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/71/Male/m/71_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/71/Male/m/71_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Grasp a straight bar cable attachment that is attached to a low pulley with a pronated (palms facing your thighs) grip that is slightly less than shoulder width. The bar should be resting on top of your thighs. Your arms should be extended with a slight bend at the elbows and your back should be straight. This will be your starting position.
    
    2. Use your side shoulders to lift the cable bar as you exhale. The bar should be close to the body as you move it up. Continue to lift it until it nearly touches your chin. Tip: Your elbows should drive the motion. As you lift the bar, your elbows should always be higher than your forearms. Also, keep your torso stationary and pause for a second at the top of the movement.
    
    3. Lower the bar back down slowly to the starting position. Inhale as you perform this portion of the movement.
    
    4. Repeat for the recommended amount of repetitions.
    
    Caution: Be very careful with how much weight you use in this exercise. Too much weight leads to bad form, which in turn can cause shoulder injury. I've seen this too many times so please no jerking, swinging and cheating. Also, if you suffer from shoulder problems, you may want to stay away from upright rows and substitute by some form of lateral raises.
    
    Variations: This exercise can also be performed using a straight or e-z bar. Another variation is to use dumbbells, though this later exercise should be reserved by the most advanced people that are well familiarized with correct execution.
    """
  }
}

struct ConcreteUprightCableRow: ConcreteExercise {
  var exercise: Exercise {
    return UprightCableRow()
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
