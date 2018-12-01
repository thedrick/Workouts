//
//  TableView.swift
//  Workouts
//
//  Created by Tyler Hedrick on 4/17/18.
//  Copyright © 2018 Tyler Hedrick. All rights reserved.
//

import UIKit

final class TableView: UITableView {
  
  init() {
    super.init(frame: .zero, style: .plain)
    delegate = self
    dataSource = self
    translatesAutoresizingMaskIntoConstraints = false
    rowHeight = UITableViewAutomaticDimension
    register(TableViewCell.self, forCellReuseIdentifier: "cell")
    tableFooterView = UIView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func setSections(_ sections: [TableViewSection]) {
    self.sections = sections
    reloadData()
  }
  
  // MARK: Private
  
  private var sections: [TableViewSection] = []
  
}

extension TableView: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = sections[indexPath.section].rows[indexPath.row]
    row.selectionHandler?(row.loadedView)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}

extension TableView: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
    let section = sections[sectionIndex]
    return section.rows.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = sections[indexPath.section].rows[indexPath.row]
    let cell = dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    cell.view = row.loadedView
    return cell
  }
  
}
