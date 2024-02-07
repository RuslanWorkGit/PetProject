//
//  Constants.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 06.02.2024.
//

import Foundation
import UIKit

enum APIs: String {
    case apiKey = "bcfdb7391902da79ee3c28ea459c4d04"
    case getMovieGenreList = "https://api.themoviedb.org/3/genre/movie/list"
    case getResultWithGenre = "https://api.themoviedb.org/3/discover/movie"
    case getImage = "https://image.tmdb.org/t/p/original"

    
}
