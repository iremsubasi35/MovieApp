//
//  MovieDetail.swift
//  FilmApp
//
//  Created by Irem Subası on 7.09.2022.
//

import Foundation
import UIKit


class MovieDetailImageCell: UITableViewCell{
    @IBOutlet weak var imView: UIView!
}

class MovieDetailTitleCell : UITableViewCell{
    @IBOutlet weak var lblTitle: UILabel!
}

class MovieDetailDescriptionCell : UITableViewCell{
    @IBOutlet weak var lblDescription: UITextView!
}
 
class MovieDetailVC : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableViewMovieDetail: UITableView!
    
    var movieId: String = ""
    //private var Movie : Movie  = MovieResult(id: "", title: "", description: "")
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        tableViewMovieDetail.delegate = self
        tableViewMovieDetail.dataSource = self
}

func tableView( _ tableView: UITableView, cellForRowAt indexpath : IndexPath) ->UITableViewCell{
    if indexpath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailImageCell", for : indexpath) as!  MovieDetailImageCell
        
        return cell
    } else if indexpath.row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailTitleCell", for : indexpath) as! MovieDetailTitleCell
        return cell
    } else if indexpath.row == 2 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailDesctiprion", for : indexpath) as! MovieDetailDescriptionCell
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
            return UITableView.automaticDimension
       }
    return 0
        }
}


