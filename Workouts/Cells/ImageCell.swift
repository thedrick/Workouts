//
//  ImageCell.swift
//  Workouts
//
//  Created by Tyler Hedrick on 10/11/17.
//  Copyright © 2017 Tyler Hedrick. All rights reserved.
//

import UIKit

final class ImageCell: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(imageView2)
    imageView2.translatesAutoresizingMaskIntoConstraints = false
    imageView2.constrainToSuperviewMargins()
    imageView2.contentMode = .scaleAspectFit
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var imageDownloadCompletionBlock: (UIImage) -> Void = { _ in }
  
  public var imageURL: URL? {
    didSet {
      imageView2.sd_setImage(
        with: imageURL,
        completed: { [weak self] (image, _, _, _) in
          if let image = image {
            self?.imageDownloadCompletionBlock(image)
          }
      })
    }
  }
  
  private let imageView2 = UIImageView()
  
}
