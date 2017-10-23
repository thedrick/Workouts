//
//  DonkeyCalfRaises.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/12/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation
import UIKit

struct DonkeyCalfRaises: Exercise {
  var name: String {
    return "Donkey Calf Raises"
  }
  
  var images: [URL] {
    return [
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/296/Male/m/296_2.jpg")!,
      URL(string: "https://www.bodybuilding.com/exercises/exerciseImages/sequences/296/Male/m/296_1.jpg")!
    ]
  }
  
  var description: String {
    return """
    1. For this exercise you will need access to a donkey calf raise machine. Start by positioning your lower back and hips under the padded lever provided. The tailbone area should be the one making contact with the pad.
    
    2. Place both of your arms on the side handles and place the balls of your feet on the calf block with the heels extending off. Align the toes forward, inward or outward, depending on the area you wish to target, and straighten the knees without locking them. This will be your starting position.
    
    3. Raise your heels as you breathe out by extending your ankles as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending at any time. Hold the contracted position by a second before you start to go back down.
    
    4. Go back slowly to the starting position as you breathe in by lowering your heels as you bend the ankles until calves are stretched.
    
    5. Repeat for the recommended amount of repetitions.
    
    Variations: If you don't have a machine available but have access to a calf block and a sturdy object to hold on to, you can perform this using as resistance a person sitting on your lower back (around the tailbone area).
    """
  }
}

struct ConcreteDonkeyCalfRaises: ConcreteExercise {
  var exercise: Exercise {
    return DonkeyCalfRaises()
  }
  
  var setCount: Int {
    return 2
  }
  
  var repCount: Int {
    return 10
  }

}
