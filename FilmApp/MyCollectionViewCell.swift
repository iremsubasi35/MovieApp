//
//  MyCollectionViewCell.swift
//  FilmApp
//
//  Created by Irem Subası on 2.09.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with image: UIImage){
        imageView.image = image
    }

    static func nib() -> UINib{
        return UINib(nibName:"MyCollectionViewCell", bundle: nil)
    }
}
