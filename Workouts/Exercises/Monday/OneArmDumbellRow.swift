//
//  OneArmDumbellRow.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct OneArmDumbellRow: Exercise {
  var name: String {
    return "One-arm Dumbell Row"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/13/Male/m/13_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/13/Male/m/13_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Choose a flat bench and place a dumbbell on each side of it.
    
    2. Place the right leg on top of the end of the bench, bend your torso forward from the waist until your upper body is parallel to the floor, and place your right hand on the other end of the bench for support.
    
    3. Use the left hand to pick up the dumbbell on the floor and hold the weight while keeping your lower back straight. The palm of the hand should be facing your torso. This will be your starting position.
    
    4. Pull the resistance straight up to the side of your chest, keeping your upper arm close to your side and keeping the torso stationary. Breathe out as you perform this step. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. Also, make sure that the force is performed with the back muscles and not the arms. Finally, the upper torso should remain stationary and only the arms should move. The forearms should do no other work except for holding the dumbbell; therefore do not try to pull the dumbbell up using the forearms.
    
    5. Lower the resistance straight down to the starting position. Breathe in as you perform this step.
    
    6. Repeat the movement for the specified amount of repetitions.
    
    7. Switch sides and repeat again with the other arm.
    
    Variations: One-arm rows can also be performed using a high pulley or a low pulley instead of a dumbbell.
    """
  }
}

struct ConcreteOneArmDumbellRow: ConcreteExercise {
  var exercise: Exercise {
    return OneArmDumbellRow()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
