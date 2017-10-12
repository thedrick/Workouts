//
//  ChinUp.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct ChinUp: Exercise {
  var name: String {
    return "Chin-Up"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/129/Male/m/129_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/129/Male/m/129_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Grab the pull-up bar with the palms facing your torso and a grip closer than the shoulder width.
    
    2. As you have both arms extended in front of you holding the bar at the chosen grip width, keep your torso as straight as possible while creating a curvature on your lower back and sticking your chest out. This is your starting position. Tip: Keeping the torso as straight as possible maximizes biceps stimulation while minimizing back involvement.
    
    3. As you breathe out, pull your torso up until your head is around the level of the pull-up bar. Concentrate on using the biceps muscles in order to perform the movement. Keep the elbows close to your body. Tip: The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.
    
    4. After a second of squeezing the biceps in the contracted position, slowly lower your torso back to the starting position; when your arms are fully extended. Breathe in as you perform this portion of the movement.
    
    5. Repeat this motion for the prescribed amount of repetitions.
    
    Variations:
    
    If you are new at this exercise and do not have the strength to perform it, use a pull-up assist machine if available. These machines use weight to help you push your bodyweight.
    
    Otherwise, a spotter holding your legs can help.
    
    On the other hand, more advanced lifters can add weight to the exercise by using a weight belt that allows the addition of weighted plates.
    """
  }
}

struct ConcreteChinUp: ConcreteExercise {
  var exercise: Exercise {
    return ChinUp()
  }
  
  var setCount: Int {
    return 3
  }
  
  var repCount: Int {
    return 10
  }
  
  var startingWeight: Int {
    return 20
  }
}
