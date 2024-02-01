//
//  MovieRealm.swift
//  TMDBApp
//
//  Created by Ruslan Liulka on 01.02.2024.
//

import Foundation
import RealmSwift

class MovieRealm: Object {
    @Persisted var id: Int
    @Persisted var adult: Bool
    @Persisted var backdropPath: String
    @Persisted var title: String
    @Persisted var originalLanguage: String
    @Persisted var originalTitle: String
    @Persisted var overview: String
    @Persisted var posterPath: String
    @Persisted var mediaType: String
    @Persisted var genreIDS: Int
    @Persisted var popularity: Double
    @Persisted var releaseDate: String
    @Persisted var video: Bool
    @Persisted var voteAverage: Double
    @Persisted var voteCount: Int
}

