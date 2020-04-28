//
//  LibraryAPI.swift
//  MovieDirectors
//
//  Created by Shruti Sharma on 4/27/20.
//  Copyright © 2020 Shruti Sharma. All rights reserved.
//

import Foundation

class LibraryAPI {
  
  static let shared = LibraryAPI()
  private var directors = [Director]()

  private init() {
    
  }

  
  func getDirectors() -> [Director]? {
    guard let directorsJsonUrl = Bundle.main.url(forResource: Constants.Filenames.Directors, withExtension: nil) else {
      print("File doesn't exist.")
      return []
    }
    do {
      let data = try Data(contentsOf: directorsJsonUrl)
      let decoder = JSONDecoder()
      let decodedData = try decoder.decode(Directors.self, from: data)
      directors = decodedData.directors
    } catch {
      
    }
    return directors
  }
  
  func addDirector() {
    
  }
  
  func deleteDirector() {
    
  }
  
}
