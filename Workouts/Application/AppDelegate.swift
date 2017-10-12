//
//  AppDelegate.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/7/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let monday = WorkoutViewController(
      workout: WorkoutBuilder.mondayWorkout,
      tabTitle: "Monday")
    let tuesday = WorkoutViewController(
      workout: WorkoutBuilder.tuesdayWorkout,
      tabTitle: "Tuesday")
    let thursday = WorkoutViewController(
      workout: WorkoutBuilder.thursdayWorkout,
      tabTitle: "Thursday")
    let tabVC = UITabBarController()
    let navVCs = [monday, tuesday, thursday].map { vc -> UINavigationController in
      return UINavigationController(rootViewController: vc)
    }
    tabVC.viewControllers = navVCs
    
    let todayComponents = Calendar.current.dateComponents(in: TimeZone.current, from: Date())
    var startingIndex = 0
    if todayComponents.weekday == 3 {
      startingIndex = 1
    } else if todayComponents.weekday == 5 {
      startingIndex = 2
    }
    tabVC.selectedIndex = startingIndex
    
    self.window!.rootViewController = tabVC
    self.window!.makeKeyAndVisible()
    return true
  }

}

