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
    
    // static let shared = MovieService() -> singleton object !!  araştır.
    // movieManager.shared.getMovie şeklinde yazılır.get movieye erişmek istendiğinde
    
    fileprivate var baseUrl=""
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    func getMovie(endPoint:String,completion:([Movie],Error?)->Void){
        print("1")
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil,
                   interceptor: nil, requestModifier: nil).response { (responseData) in
            print("2")
            print("we got the response")
            guard let data = responseData.data else {
                completion([],nil)
                return
            }
            
            do {
                let Movies = try JSONDecoder().decode([Movie].self, from: data)       // 1 3  2
                
                completion(Movies,nil)
            } catch { 
                print("error==\(error)")
                completion([],error)
            }
        }
        print("3")
    }
    
}
