//
//  Movie.swift
//  FilmApp
//
//  Created by Irem Subası on 5.09.2022.
//

import Foundation


struct MovieModel : Codable {
   let id: Int
   let title: String
    let posterPath: String?
    let overview: String
    let runTime: Int?

    init(id: Int, title: String, posterPath: String?, overview: String, runTime:Int?) {
          self.id = id
          self.title = title
          self.posterPath = posterPath
          self.overview = overview
          self.runTime = runTime
      }
}




struct Movie : Codable {
    let page: Int
    let results: [MovieResult]
}

struct MovieResult : Codable {
    let id: Int
    let title: String?
    let overview: String?
}
