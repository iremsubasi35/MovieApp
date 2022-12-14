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
    let posterPath: String?
    enum CodingKeys: String,CodingKey{
        case id,title,overview
        case posterPath = "poster_path"
    }
}
 
struct MovieDetailModel : Codable{
    let overview: String?
    let posterPath : String?
    let orginalTitle : String?
    enum CodingKeys : String, CodingKey{
        case posterPath = "poster_path"
        case orginalTitle = "original_title"
        case overview = "overview"
    }
}
