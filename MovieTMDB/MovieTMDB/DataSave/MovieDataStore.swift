//
//  MovieDataStore.swift
//  MovieTMDB
//
//  Created by Ruslan Liulka on 05.02.2024.
//

import Foundation

class MovieDataStore {
    static let shared = MovieDataStore()
    
    var arrayOfGenre: [Genre] = []
    var selectedMovies: [MovieByGenre] = []
    
    private init() {}
}
