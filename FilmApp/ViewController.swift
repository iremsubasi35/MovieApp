//
//  ViewController.swift
//  FilmApp
//
//  Created by Irem Subası on 26.08.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        super.viewDidLoad()
        let service = MovieService(baseUrl: "https://api.themoviedb.org/3/movie/")
        service.getMovie(endPoint: "popular?api_key=0354d19696d91e6a292fbd12ae3360df")
        
        let layout=UICollectionViewFlowLayout()
        layout.itemSize=CGSize(width:120, height: 120)
        collectionView.collectionViewLayout  = layout
        
        self.navigationItem.title = "Movies"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("you tapped me")
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.setupUI(with: )
        model[indexPath.row]
       // cell.configure(with: UIImage(named: "image")!)  // asetten çekiyor silinecek
        // apı dan çekilen bilgileri bu modele uyarlamak. indexpath.row
        
        return cell
    }
}
 extension ViewController: UICollectionViewDelegateFlowLayout{
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 120, height: 120)
     }
    }

