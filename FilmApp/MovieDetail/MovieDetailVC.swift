//
//  MovieDetail.swift
//  FilmApp
//
//  Created by Irem Subası on 7.09.2022.
//

import Foundation
import UIKit
import Kingfisher


class MovieDetailImageCell: UITableViewCell{
    @IBOutlet weak var imView: UIImageView!
}

class MovieDetailTitleCell : UITableViewCell{
    @IBOutlet weak var lblTitle: UILabel!
}

class MovieDetailDescriptionCell : UITableViewCell{
    @IBOutlet weak var txtDescription: UITextView!
}
 
class MovieDetailVC : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableViewMovieDetail: UITableView!
     var movie : MovieResult?
     var movieId: String = ""
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        tableViewMovieDetail.register(UINib(nibName: "MovieDetailImageCell", bundle: nil), forCellReuseIdentifier: "MovieDetailImageCell")
        tableViewMovieDetail.register(UINib(nibName: "MovieDetailTitleCell", bundle: nil), forCellReuseIdentifier: "MovieDetailTitleCell")
        tableViewMovieDetail.register(UINib(nibName: "MovieDetailDescriptionCell", bundle: nil), forCellReuseIdentifier: "MovieDetailDescriptionCell")
        
        tableViewMovieDetail.delegate = self
        tableViewMovieDetail.dataSource = self
        
        let service = MovieService(baseUrl: "https://api.themoviedb.org/3/movie/")
          service.getMovieDetails(endPoint: "550?api_key=0354d19696d91e6a292fbd12ae3360df") {       movies, error in
              print(movies)
              print(error)
              
          }
}

func tableView( _ tableView: UITableView, cellForRowAt indexpath : IndexPath) ->UITableViewCell{
    if indexpath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailImageCell", for : indexpath) as!  MovieDetailImageCell
        let imagePath = "https://image.tmdb.org/t/p/w500" + (movie?.posterPath ?? "")
        let url = URL(string: imagePath)
        cell.imView.kf.setImage(with: url)
      //  cell.imView.kf.setImage( with: imagePath, placeholder: UIImage(named: "empty"))
        return cell
        
    } else if indexpath.row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailTitleCell", for : indexpath) as! MovieDetailTitleCell
        cell.lblTitle.text = movie?.title
        return cell
        
    } else if indexpath.row == 2 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailDescriptionCell", for : indexpath) as! MovieDetailDescriptionCell
        cell.txtDescription.text = movie?.overview
       return cell
    }
    return UITableViewCell()
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
           return 209
        } else if indexPath.row == 1 {
            return 50
        } else if indexPath.row == 2 {
            return 500
            //UITableView.automaticDimension
       }
    return 0
        }
}


