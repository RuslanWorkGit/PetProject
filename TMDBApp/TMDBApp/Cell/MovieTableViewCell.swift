//
//  MovieTableViewCell.swift
//  TMDBApp
//
//  Created by Ruslan Liulka on 01.02.2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var movieTypeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with movie: MovieRealm) {
        titleLabel.text = movie.title
        
        let basePath = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: basePath + movie.posterPath)
        if let url = url {
            downloadImage(from: url, variableName: posterImage)
        }
        
        originalTitleLabel.text = movie.originalTitle
        movieTypeLabel.text = movie.mediaType
        genreLabel.text = "Some Genre"
        releaseDataLabel.text = movie.releaseDate
        popularityLabel.text = "Popularity: \(movie.popularity)"
        
        adultLabel.text = movie.adult ? "This movie for adult" : "This movie for kid"
    }
    
    func downloadImage(from url: URL, variableName: UIImageView) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                // Handle the error (e.g., show an alert)
                print("Error downloading image: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    variableName.image = image
                } else {
                    // Handle the scenario where image data couldn't be converted to a UIImage
                    // Perhaps set a default image
                }
            }
        }.resume()
    }
    
}
