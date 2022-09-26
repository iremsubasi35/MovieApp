//
//  MyCollectionViewCell.swift
//  FilmApp
//
//  Created by Irem Subası on 2.09.2022.
//

import UIKit
import Kingfisher

 final class MovieListCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setupUI(with model: MovieListCellModel){ // kingfisher burda çekilecek
       // imageView.image = model.imageUrl
        let imageURL = "https://image.tmdb.org/t/p/w500" + (model.imageURL)
        let url = URL(string: imageURL ) //DOLDUR
        imageView.kf.setImage(with: url)
        movieTitle.text = model.title
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
     //https://image.tmdb.org/t/p/w500/62HCnUTziyWcpDaBO2i1DX17ljH.jpg

    static func nib() -> UINib{
        return UINib(nibName:"MyCollectionViewCell", bundle: nil)
    }
    
         }
     
    

