//
//  GetGenre.swift
//  MovieTMDB
//
//  Created by Ruslan Liulka on 02.02.2024.
//

import Foundation
import Alamofire

func getGenre(url: String, completion: @escaping ([Genre]?) -> Void) {
    // var arrayOfGenre: [Genre] = []
    
    
    AF.request(url).responseDecodable(of: GenreList.self) { responce in
        switch responce.result {
        case .success(let genreList):
            completion(genreList.genres)
        case .failure(let error):
            print("Error: \(error)")
            completion(nil)
        }
    }
}
