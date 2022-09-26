//
//  ViewController.swift
//  FilmApp
//
//  Created by Irem Subası on 26.08.2022.
//

import UIKit
// https://image.tmdb.org/t/p/w500/62HCnUTziyWcpDaBO2i1DX17ljH.jpg

class ViewController: UIViewController {
    private var movies : [MovieResult]=[] //var tanımlaması
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
     //   let service = MovieService(baseUrl: "https://api.themoviedb.org/3/movie/")
//        service.getMovieDetails(endPoint: "550?api_key=0354d19696d91e6a292fbd12ae3360df") {       movies, error in
//            print(movies)
//            print(error)
//
//        }
        //service.getMovie(endPoint: "popular?api_key=0354d19696d91e6a292fbd12ae3360df")
        //https://api.themoviedb.org/3/movie/550?api_key=0354d19696d91e6a292fbd12ae3360df //detay sayfasında bunu kullan id 550 yazan yer
        //https://api.themoviedb.org/3/movie/popular?api_key=0354d19696d91e6a292fbd12ae3360df
        let layout=UICollectionViewFlowLayout()// collectionview de layout nasıl değiştirilir. updateing collectionview layout itemsize dinamik hesaplamak lazım
        // posterlerin arasınmdaki nboşluğu layout üzerinden değiştirmeey bak
        
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
      //  let currentMovie = filteredRecipes[indexPath.row]
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
            //    viewController.recipeId = currentRecipe.id
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
        
       // cell.setupUI(with: )
        //model[indexPath.row]
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

