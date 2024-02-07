//
//  DataStore.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 06.02.2024.
//

import Foundation

class MovieDataStore {
    static let shared = MovieDataStore()
    
    var arrayOfGenre: [Genre] = []
    var selectedMovies: [Movie] = []
    
    private init() {}
}
