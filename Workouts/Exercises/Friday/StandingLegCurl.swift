//
//  StandingLegCurl.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/12/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct StandingLegCurl: Exercise {
  var name: String {
    return "Standing Leg Curl"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/68/Male/m/68_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/68/Male/m/68_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Adjust the machine lever to fit your height and lie with your torso bent at the waist facing forward around 30-45 degrees (since an angled position is more favorable for hamstrings recruitment) with the pad of the lever on the back of your right leg (just a few inches under the calves) and the front of the right leg on top of the machine pad.
    
    2. Keeping the torso bent forward, ensure your leg is fully stretched and grab the side handles of the machine. Position your toes straight. This will be your starting position.
    
    3. As you exhale, curl your right leg up as far as possible without lifting the upper leg from the pad. Once you hit the fully contracted position, hold it for a second.
    
    4. As you inhale, bring the legs back to the initial position. Repeat for the recommended amount of repetitions.
    
    5. Perform the same exercise now for the left leg.
    """
  }
}

struct ConcreteStandingLegCurl: ConcreteExercise {
  var exercise: Exercise {
    return StandingLegCurl()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
