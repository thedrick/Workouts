//
//  OverlayPresentationController.swift
//  Workouts
//
//  Created by tyler_hedrick on 4/15/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

public final class OverlayPresentationController: UIPresentationController {

  public override func presentationTransitionWillBegin() {
    dimmingView.alpha = 0
    dimmingView.translatesAutoresizingMaskIntoConstraints = false
    if let containerView = containerView {
      containerView.backgroundColor = .clear
      containerView.addSubview(dimmingView)
      dimmingView.constrainToSuperview()
    }
    if let transitionCoordinator = presentingViewController.transitionCoordinator {
      transitionCoordinator.animate(alongsideTransition: { [dimmingView] _ in
        dimmingView.alpha = 1
      }, completion: nil)
    }
  }

  public override func dismissalTransitionWillBegin() {
    if let transitionCoordinator = presentingViewController.transitionCoordinator {
      transitionCoordinator.animate(alongsideTransition: { [dimmingView] _ in
        dimmingView.alpha = 0
      }, completion: nil)
    }
  }

  private lazy var dimmingView: UIView = {
    let dimmingView = UIView()
    dimmingView.backgroundColor = UIColor(white: 1, alpha: 0.8)
    return dimmingView
  }()

}
