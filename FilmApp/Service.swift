//
//  Service.swift
//  FilmApp
//
//  Created by Irem Subası on 5.09.2022.
//

import Foundation
import Alamofire

class MovieService{
    fileprivate var baseUrl=""
    init(baseUrl: String){
        self.baseUrl=baseUrl
    }
    func getMovie(endPoint:String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            print("we got the response")
            guard let data = responseData.data else{return}
    }
}
}
