//
//  NetworkManager.swift
//  MovieTMDB
//
//  Created by Ruslan Liulka on 05.02.2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()

    
    private init() {}
    
    func getGenre(url: String, completion: @escaping ([Genre]) -> Void) {
        var arrayOfGenre: [Genre] = []
        
        AF.request(url).responseDecodable(of: GenreList.self) { response in
            switch response.result {
            case .success(let genreList):
                arrayOfGenre = genreList.genres
                print(genreList.genres)
            case .failure(let error):
                arrayOfGenre = []
                print("Error: \(error)")
            }
            
            completion(arrayOfGenre)
        }
    }
    
    func getMovieGenre(url: String, completion: @escaping ([MovieByGenre]) -> Void) {
        var arrayOfMovie: [MovieByGenre] = []
        
        AF.request(url).responseDecodable(of: GenreMovie.self) { response in
            switch response.result {
            case .success(let movieGenreList):
                arrayOfMovie = movieGenreList.results
            case .failure(let error):
                arrayOfMovie = []
                print("Error: \(error)")
            }
            
            completion(arrayOfMovie)
        }
    }
    
}
