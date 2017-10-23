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

    let listVC = WorkoutListViewController()
    let listNav = UINavigationController(rootViewController: listVC)
    
    let exerciseVC = ExerciseListViewController()
    let exerciseNav = UINavigationController(rootViewController: exerciseVC)
    
    let tabVC = UITabBarController()
    tabVC.viewControllers = [listNav, exerciseNav]
    
    UINavigationBar.appearance().tintColor = Colors.primaryColor
    UITabBar.appearance().tintColor = Colors.primaryColor
    
    self.window!.rootViewController = tabVC
    self.window!.makeKeyAndVisible()
    return true
  }

}

