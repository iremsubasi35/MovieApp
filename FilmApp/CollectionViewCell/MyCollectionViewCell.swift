//
//  MyCollectionViewCell.swift
//  FilmApp
//
//  Created by Irem Subası on 2.09.2022.
//

import UIKit
import Kingfisher

 final class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setupUI(with model: MyCollectionViewCellModel){ // kingfisher burda çekilecek
       // imageView.image = model.imageUrl
        let url = URL(string: model.imageUrl ?? "") //DOLDUR
        imageView.kf.setImage(with: url)
        movieTitle.text = model.title
    }

    static func nib() -> UINib{
        return UINib(nibName:"MyCollectionViewCell", bundle: nil)
    }
    
         }
     
    

