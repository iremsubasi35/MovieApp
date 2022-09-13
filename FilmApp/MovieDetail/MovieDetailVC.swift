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
 
class movieDetailVC : UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableViewMovieDetail: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailImageCell", for: indexPath) as! MovieDetailImageCell
                let imagePath = MyCollectionViewCell.imagePath()
                imageView.kf.setImage(with: url)
            }
        else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailTitleCell", for : indexPath) as!
                    MovieDetailTitleCell
            }
        else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailDescriptionCell", for : indexPath) as! MovieDetailDescriptionCell
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

    
    
    var MovieId: String = ""
    
    //private var Movie : Movie  = Movie(id: "", title: "", description: "")
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        tableViewMovieDetail.delegate = self
        tableViewMovieDetail.dataSource = self
}
}
}
}

