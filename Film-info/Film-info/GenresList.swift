//
//  GenresList.swift
//  Film-info
//
//  Created by Ruslan Liulka on 13.12.2023.
//

import Foundation
import Alamofire

func getGenres(listGenres: [Int], completion: @escaping ([String]) -> Void) {
    let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=bcfdb7391902da79ee3c28ea459c4d04"
    
    AF.request(url).validate().responseDecodable(of: GenreList.self) { response in
        switch response.result {
        case .success(let genreList):
            let genreNames = genreList.genres.filter { listGenres.contains($0.id) }.map { $0.name }
            completion(genreNames)
        case .failure(let error):
            print(error)
            completion([])
        }
    }
}
