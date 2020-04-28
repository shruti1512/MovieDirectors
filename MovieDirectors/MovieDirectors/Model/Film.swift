//
//  Film.swift
//  MovieDirectors
//
//  Created by Shruti Sharma on 4/27/20.
//  Copyright © 2020 Shruti Sharma. All rights reserved.
//

import Foundation

struct Film: Codable {
  let title: String
  let year: String
  let poster: String
  let plot: String
  var isExpanded: Bool
  
  //Custom decoder to set false for isExpanded proprty not found in json file
  init(from decoder: Decoder) throws {
    let containerDecoder = try decoder.container(keyedBy: CodingKeys.self)
    self.title = try containerDecoder.decode(String.self, forKey: .title)
    self.plot = try containerDecoder.decode(String.self, forKey: .plot)
    self.poster = try containerDecoder.decode(String.self, forKey: .poster)
    self.year = try containerDecoder.decode(String.self, forKey: .year)
    self.isExpanded = false
  }
}
