//
//  WorkoutBuilder.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import Foundation

struct WorkoutBuilder {
  
  static var workoutWeek = [
    WorkoutBuilder.mondayWorkout,
    WorkoutBuilder.tuesdayWorkout,
    WorkoutBuilder.thursdayWorkout,
    WorkoutBuilder.fridayWorkout,
    WorkoutBuilder.customComboWorkout,
  ]
  
  static var todayWorkout: Workout? {
    let todayComponents = Calendar.current.dateComponents(in: TimeZone.current, from: Date())
    guard let weekday = todayComponents.weekday else { return nil }
    switch weekday {
    case 2: return mondayWorkout
    case 3: return tuesdayWorkout
    case 5: return thursdayWorkout
    case 6: return fridayWorkout
    default: return nil
    }
  }
  
  static var mondayWorkout: Workout {
    return Workout(
      name: "Monday - Upper Body",
      exercises: [
        ConcreteButterfly(),
        ConcreteWideGripLatPulldown(),
        ConcreteTricepsPushdown(),
        ConcreteDumbellBenchPress(),
        ConcreteSeatedDumbellCurl(),
        ConcreteOneArmDumbellRow(),
        ConcreteSideLateralRaise(),
        ConcreteDumbellShrug(),
        ConcreteStandingMilitaryPress(),
        ConcreteLyingTricepsPress(),
        ConcretePreacherCurl(),
      ])
  }
  
  static var tuesdayWorkout: Workout {
    return Workout(
      name: "Tuesday - Lower Body",
      exercises: [
        ConcreteLegPress(),
        ConcreteLegExtensions(),
        ConcreteSeatedLegCurl(),
        ConcreteLyingLegCurls(),
        ConcreteStandingCalfRaises(),
        ConcreteSeatedCalfRaise(),
        ConcreteAbCrunchMachine(),
        ConcreteCrunches()
      ])
  }
  
  static var thursdayWorkout: Workout {
    return Workout(
      name: "Thursday - Upper Body",
      exercises: [
        ConcreteChinUp(),
        ConcreteSeatedCableRows(),
        ConcreteUprightCableRow(),
        ConcreteEZBarCurl(),
        ConcreteTricepsPushdown(),
        ConcreteDipsChest(),
        ConcreteCableCrossover(),
        ConcreteSideLateralRaise(),
        ConcreteHammerCurl(),
        ConcreteInclineDumbellPress(),
        ConcreteStandingMilitaryPress(),
      ])
  }
  
  static var fridayWorkout: Workout {
    return Workout(
      name: "Friday - Lower Body",
      exercises: [
        ConcreteDonkeyCalfRaises(),
        ConcreteFridayStandingCalfRaises(),
        ConcreteSeatedLegCurl(),
        ConcreteStandingLegCurl(),
        ConcreteFridayLegPress(),
        ConcreteHackSquat(),
        ConcreteAbCrunchMachine(),
        ConcreteCrunches()
      ])
  }
  
  static var customComboWorkout: Workout {
    return Workout(
      name: "Custom - Combo",
      exercises: [
        ConcreteHammerCurl(),
        ConcreteInclineDumbellPress(),
        ConcreteEZBarCurl(),
        ConcreteSeatedCableRows(),
        ConcreteTricepsPushdown(),
        ConcreteFridayStandingCalfRaises(),
        ConcreteSeatedLegCurl(),
        ConcreteFridayLegPress(),
        ConcreteHackSquat(),
        ConcreteAbCrunchMachine(),
        ConcreteCrunches()
      ])
  }
  
}
