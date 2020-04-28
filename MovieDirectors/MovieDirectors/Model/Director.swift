//
//  Director.swift
//  MovieDirectors
//
//  Created by Shruti Sharma on 4/27/20.
//  Copyright © 2020 Shruti Sharma. All rights reserved.
//

import Foundation

struct Directors: Decodable {
  var directors: [Director]
}

struct Director: Decodable {
  
  var image: String
  var name: String
  var bio: String
  var source: String
  var films: [Film]
}

