//
//  TricepsPushdown.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct TricepsPushdown: Exercise {
  var name: String {
    return "Triceps Pushdown"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/343/Male/m/343_1.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/343/Male/m/343_2.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. Attach a straight or angled bar to a high pulley and grab with an overhand grip (palms facing down) at shoulder width.
    
    2. Standing upright with the torso straight and a very small inclination forward, bring the upper arms close to your body and perpendicular to the floor. The forearms should be pointing up towards the pulley as they hold the bar. This is your starting position.
    
    3. Using the triceps, bring the bar down until it touches the front of your thighs and the arms are fully extended perpendicular to the floor. The upper arms should always remain stationary next to your torso and only the forearms should move. Exhale as you perform this movement.
    
    4. After a second hold at the contracted position, bring the bar slowly up to the starting point. Breathe in as you perform this step.
    
    5. Repeat for the recommended amount of repetitions.
    """
  }
}

struct ConcreteTricepsPushdown: ConcreteExercise {
  var exercise: Exercise {
    return TricepsPushdown()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
