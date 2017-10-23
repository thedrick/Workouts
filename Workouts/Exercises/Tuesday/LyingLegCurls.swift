//
//  LyingLegCurls.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/9/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct LyingLegCurls: Exercise {
  var name: String {
    return "Lying Leg Curls"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/52/Male/m/52_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/52/Male/m/52_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Adjust the machine lever to fit your height and lie face down on the leg curl machine with the pad of the lever on the back of your legs (just a few inches under the calves). Tip: Preferably use a leg curl machine that is angled as opposed to flat since an angled position is more favorable for hamstrings recruitment.
    
    2. Keeping the torso flat on the bench, ensure your legs are fully stretched and grab the side handles of the machine. Position your toes straight (or you can also use any of the other two stances described on the foot positioning section). This will be your starting position.
    
    3. As you exhale, curl your legs up as far as possible without lifting the upper legs from the pad. Once you hit the fully contracted position, hold it for a second.
    
    4. As you inhale, bring the legs back to the initial position. Repeat for the recommended amount of repetitions.
    
    Caution: Do not ever use so much weight on the exercise that you start using swinging and jerking as you can risk both lower back injury and also a hamstring injury.
    
    Variations: Since you have three foot positions you have in reality three exercises. The movement can also be performed with a dumbbell held in between your feet (a partner needs to place it properly). This latter exercise though is only suitable for advanced trainees. Finally, it is also possible to just use one leg at a time for better isolation.
    """
  }
}

struct ConcreteLyingLegCurls: ConcreteExercise {
  var exercise: Exercise {
    return LyingLegCurls()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}

