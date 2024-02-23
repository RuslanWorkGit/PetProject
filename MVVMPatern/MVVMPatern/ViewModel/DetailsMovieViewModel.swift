//
//  DetailsMovieViewModel.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 22.02.2024.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = movie.id
        self.movieTitle = movie.title
        self.movieDescription = movie.overview
        self.movieImage = makeImageURL(movie.backdropPath)
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
