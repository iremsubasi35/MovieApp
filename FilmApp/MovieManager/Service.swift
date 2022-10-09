//
//  Service.swift
//  FilmApp
//
//  Created by Irem Subası on 5.09.2022.
//
//https://www.programiz.com/swift-programming/closures?name=ırem&age=23

import Foundation
import Alamofire

final class MovieService{

    
    fileprivate var baseUrl=""
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    func getMovie(endPoint:String,completion:@escaping (Movie?,Error?)->Void){
        
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil,
                   interceptor: nil, requestModifier: nil).response { (responseData) in
            
            print("we got the response")
            guard let data = responseData.data else {
                completion(nil,nil)
                return
            }
            
            do {
                let Movies = try JSONDecoder().decode(Movie.self, from: data)
                
                completion(Movies,nil)
            } catch { 
                print("error==\(error)")
                completion(nil,error)
            }
        }
       
    }
    func getMovieDetails(endPoint:String,completion:@escaping (MovieDetailModel?,Error?)->Void){
        
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil,
                   interceptor: nil, requestModifier: nil).response { (responseData) in
            
            print("we got the response")
            guard let data = responseData.data else {
                completion(nil,nil)
                return
            }
            
            do {
                let Movies = try JSONDecoder().decode(MovieDetailModel.self, from: data)
                
                completion(Movies,nil)
            } catch {
                print("error==\(error)")
                completion(nil,error)
            }
        }
       
    }
}
