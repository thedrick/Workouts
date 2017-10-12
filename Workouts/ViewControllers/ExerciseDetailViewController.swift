//
//  ExerciseDetailViewController
//  Workouts
//
//  Created by Tyler Hedrick on 10/8/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

import SDWebImage

final class ExerciseDetailViewController: UIViewController {
  
  init(exercise: Exercise) {
    self.exercise = exercise
    super.init(nibName: nil, bundle: nil)
    self.title = exercise.name
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setUpViews()
    setUpConstriants()
    populateData()
  }
  
  private let exercise: Exercise
  private let stackView = UIStackView()
  private let imageStackView = UIStackView()
  private let leftImageView = UIImageView()
  private let rightImageView = UIImageView()
  private let descriptionTextView = UITextView()
  
  private func setUpViews() {
    [stackView, imageStackView, leftImageView, rightImageView, descriptionTextView].forEach { v in
      v.translatesAutoresizingMaskIntoConstraints = false
    }
    view.addSubview(stackView)
    stackView.axis = .vertical
    stackView.spacing = 0
    stackView.distribution = .fill
    stackView.addArrangedSubview(imageStackView)
    stackView.addArrangedSubview(descriptionTextView)
    
    imageStackView.axis = .horizontal
    imageStackView.distribution = .fillEqually
    imageStackView.alignment = .center
    imageStackView.spacing = 8
    imageStackView.addArrangedSubview(leftImageView)
    imageStackView.addArrangedSubview(rightImageView)
    
    descriptionTextView.font = UIFont.preferredFont(forTextStyle: .body)
    
    leftImageView.contentMode = .scaleAspectFit
    leftImageView.clipsToBounds = true
    rightImageView.contentMode = .scaleAspectFit
    rightImageView.clipsToBounds = true
  }
  
  private func populateData() {
    descriptionTextView.text = exercise.description
    leftImageView.sd_setImage(with: exercise.images.first, completed: nil)
    rightImageView.sd_setImage(with: exercise.images.last, completed: nil)
  }
  
  private func setUpConstriants() {
    stackView.constrainToSuperviewMargins()
//    imageStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
  }
  
}
