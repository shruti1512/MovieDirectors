//
//  ViewController.swift
//  MovieDirectors
//
//  Created by Shruti Sharma on 4/26/20.
//  Copyright © 2020 Shruti Sharma. All rights reserved.
//

import UIKit

class DirectorsListViewController: UIViewController {

  @IBOutlet private var tableView: UITableView!
  
  let directors = LibraryAPI.shared.getDirectors()!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 600
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? DirectorDetailViewController {
      if let indexPath = tableView.indexPathForSelectedRow {
        destination.selectedDirector = directors[indexPath.row]
      }
    }
  }
  
}

extension DirectorsListViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return directors.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorTableViewCell") as! DirectorTableViewCell
    cell.selectionStyle = .none

    cell.nameLabel.textColor = .white
    cell.bioLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
    cell.sourceLabel.textColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.0)
    cell.sourceLabel.font = UIFont.italicSystemFont(ofSize: cell.sourceLabel.font.pointSize)
    cell.nameLabel.textAlignment = .center
    cell.directorImageView.layer.cornerRadius = cell.directorImageView.frame.size.width/2
    
    let director = directors[indexPath.row]
    
    cell.directorImageView.image = UIImage(named: director.image)
    cell.nameLabel.text = director.name
    cell.bioLabel.text = director.bio
    cell.sourceLabel.text = director.source
    
    return cell
  }
  
}
