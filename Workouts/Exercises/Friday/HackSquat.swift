//
//  HackSquat.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/12/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct HackSquat: Exercise {
  var name: String {
    return "Hack Squat"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/56/Male/m/56_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/56/Male/m/56_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Place the back of your torso against the back pad of the machine and hook your shoulders under the shoulder pads provided.
    
    2. Position your legs in the platform using a shoulder width medium stance with the toes slightly pointed out. Tip: Keep your head up at all times and also maintain the back on the pad at all times.
    
    3. Place your arms on the side handles of the machine and disengage the safety bars (which on most designs is done by moving the side handles from a facing front position to a diagonal position).
    
    4. Now straighten your legs without locking the knees. This will be your starting position. (Note: For the purposes of this discussion we will use the medium stance described above which targets overall development; however you can choose any of the three stances described in the foot positioning section).
    
    5. Begin to slowly lower the unit by bending the knees as you maintain a straight posture with the head up (back on the pad at all times). Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.
    
    6. Begin to raise the unit as you exhale by pushing the floor with mainly with the heel of your foot as you straighten the legs again and go back to the starting position.
    
    7. Repeat for the recommended amount of repetitions.
    
    Variations: All foot variations discussed in the foot positioning section apply.
    """
  }
}

struct ConcreteHackSquat: ConcreteExercise {
  var exercise: Exercise {
    return HackSquat()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}

