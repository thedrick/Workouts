//
//  TableViewRow.swift
//  Workouts
//
//  Created by Tyler Hedrick on 4/17/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

typealias ViewBuilder = () -> UIView
typealias SelectionHandler = (UIView) -> Void

class TableViewRow {
  
  init(
    viewBuilder: @escaping ViewBuilder,
    selectionHandler: SelectionHandler? = nil)
  {
    self.viewBuilder = viewBuilder
    self.selectionHandler = selectionHandler
  }
  
  public let viewBuilder: ViewBuilder
  public let selectionHandler: SelectionHandler?
  
  public var loadedView: UIView {
    if view == nil {
      view = viewBuilder()
    }
    return view!
  }
  
  // MARK: Private
  
  private var view: UIView?
}
