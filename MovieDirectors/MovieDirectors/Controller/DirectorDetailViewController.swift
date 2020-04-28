//
//  DirectorDetailViewController.swift
//  MovieDirectors
//
//  Created by Shruti Sharma on 4/27/20.
//  Copyright © 2020 Shruti Sharma. All rights reserved.
//

import UIKit

class DirectorDetailViewController: UIViewController {

  var selectedDirector: Director!
  let moreTextInfo = "Tap for Details >"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      navigationItem.title = selectedDirector.name
    }
  
}

extension DirectorDetailViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedDirector.films.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorDetailTableViewCell") as! DirectorDetailTableViewCell
    cell.selectionStyle = .none
    
    let film = selectedDirector.films[indexPath.row]
    cell.filmNameLbl.text = film.title
    cell.posterImgView.image = UIImage(named: film.poster)
    
    cell.moreInfoTextView.text = film.isExpanded ? film.plot : moreTextInfo
    cell.moreInfoTextView.textAlignment = film.isExpanded ? .left : .center
    cell.moreInfoTextView.textColor = film.isExpanded ? UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) : .red
    return cell
  }
  
}

extension DirectorDetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    guard let cell = tableView.cellForRow(at: indexPath) as? DirectorDetailTableViewCell else {
      return
    }
    
    var film = selectedDirector.films[indexPath.row]
    film.isExpanded = !film.isExpanded
    
    selectedDirector.films[indexPath.row] = film
    
    cell.moreInfoTextView.text = film.isExpanded ? film.plot : moreTextInfo
    cell.moreInfoTextView.textAlignment = film.isExpanded ? .left : .center
    cell.moreInfoTextView.textColor = film.isExpanded ? UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) : .red
    
    tableView.beginUpdates()
    tableView.endUpdates()
    
    tableView.scrollToRow(at: indexPath, at: .top, animated: true)
  }
}
