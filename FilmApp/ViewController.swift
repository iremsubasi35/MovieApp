//
//  ViewController.swift
//  FilmApp
//
//  Created by Irem Subası on 26.08.2022.
//

import UIKit


class ViewController: UIViewController {
    private var movies : [MovieResult]=[] 
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        collectionView.register(MovieListCell.nib(), forCellWithReuseIdentifier: MovieListCell.identifier)
        
        super.viewDidLoad()
        let service = MovieService(baseUrl: "https://api.themoviedb.org/3/movie/")
        service.getMovie(endPoint: "popular?api_key=0354d19696d91e6a292fbd12ae3360df") { movies, error in
            self.movies = movies?.results ?? []
            self.collectionView.reloadData()
            print(movies)
            print(error)
        }
        
        //https://api.themoviedb.org/3/movie/550?api_key=0354d19696d91e6a292fbd12ae3360df
        //https://api.themoviedb.org/3/movie/popular?api_key=0354d19696d91e6a292fbd12ae3360df
        
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
      
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        viewController.movie = movies[indexPath.row]
            
                self.navigationController?.pushViewController(viewController, animated: true)
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.identifier, for: indexPath) as! MovieListCell
        let cellModel = MovieListCellModel(imageURL: movies[indexPath.row].posterPath ?? "", title: movies[indexPath.row].title ?? "")
        cell.setupUI(with: cellModel)
    
        
        return cell
    }
}
 extension ViewController: UICollectionViewDelegateFlowLayout{
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 120, height: 120)
     }
    }

