//
//  APICaller.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 18.02.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel,NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + "trending/movie/week?language=en-US&api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponce, urlResponce, error in
            
            if error == nil, let data = dataResponce, let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
            
        }.resume()
    }
}
