//
//  ViewController.swift
//  MovieDirectors
//
//  Created by Shruti Sharma on 4/26/20.
//  Copyright © 2020 Shruti Sharma. All rights reserved.
//

import UIKit

class DirectorsListViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

extension DirectorsListViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorTableViewCell") as! DirectorTableViewCell
    return cell
  }
  
}
