//
//  GenresNetworkManager.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 06.02.2024.
//

import Foundation
import Alamofire

class GenresNetworkManager {
    static let shared = GenresNetworkManager()
    
    func getMovieGenres(completion: @escaping ([Genre]) -> Void) {
        let url = APIs.getMovieGenreList.rawValue
        let apiKey = "?api_key=" + APIs.apiKey.rawValue
        var arrayOfGenre: [Genre] = []
        
        AF.request(url + apiKey).responseDecodable(of: GenreList.self) { response in
            switch response.result {
            case .success(let genreList):
                arrayOfGenre = genreList.genres
                print(arrayOfGenre)
            case .failure(let failure):
                arrayOfGenre = []
                print("Error: \(failure)")
            }
            
            completion(arrayOfGenre)
        }
    }
    
    func getMovie(with genre: String, completion: @escaping ([Movie]) -> Void) {
        let url = APIs.getResultWithGenre.rawValue
        let apiKey = "?api_key=" + APIs.apiKey.rawValue
        let withGenre = "&with_genres=" + genre
        var arrayOfMovie: [Movie] = []
        
        AF.request(url + apiKey + withGenre).responseDecodable(of: MoviesByGenre.self) { responce in
            switch responce.result {
            case .success(let movieInfo):
                arrayOfMovie = movieInfo.results
            case .failure(let failure):
                arrayOfMovie = []
                print("Error: \(failure)")
            }
            
            completion(arrayOfMovie)
        }
        
    }
}
