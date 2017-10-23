//
//  ExerciseDetailViewController
//  Workouts
//
//  Created by Tyler Hedrick on 10/8/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

import SDWebImage

final class ExerciseDetailViewController: UITableViewController {
  
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
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "textCell")
    tableView.register(ImageCell.self, forCellReuseIdentifier: "imageCell")
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0, 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
      cell.imageURL = exercise.images[indexPath.row]
      cell.imageDownloadCompletionBlock = { [unowned self] image in
        if !self.downloadedImages.contains(image) {
          self.downloadedImages.insert(image)
          self.tableView.reloadData()
        }
      }
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
      cell.textLabel?.numberOfLines = 0
      cell.textLabel?.text = exercise.description
      return cell
    }
  }
  
  private let exercise: Exercise
  private var downloadedImages = Set<UIImage>()
  
}
