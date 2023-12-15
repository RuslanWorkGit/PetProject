//
//  MovieTableViewCell.swift
//  Film-info
//
//  Created by Ruslan Liulka on 12.12.2023.
//

import UIKit


class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var mediaTypeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func downloadImage(from url: URL, variableName: UIImageView) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }

                if let error = error {
                    print("Error downloading image: \(error)")
                    return
                }

                DispatchQueue.main.async {
                    if let data = data, let image = UIImage(data: data) {
                        variableName.image = image
                    } else {
                        
                    }
                }
            }.resume()
        }

    func configure(with data: FilmInfo) {
        
        let basePath = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: basePath + data.posterPath)
        if let url = url {
            downloadImage(from: url, variableName: avatarImageView)
        }
        
        self.titleLabel.text = data.title
        self.originalTitleLabel.text = data.originalTitle
        
        if data.adult {
            self.adultLabel.text = "Adult: " + "\(data.mediaType.rawValue) is for 18+ person"
        } else {
            self.adultLabel.text = "Adult: " + "\(data.mediaType.rawValue) is for young person"
        }
        
        self.languageLabel.text = "Language: " + data.originalLanguage.rawValue
        
        switch data.originalLanguage {
        case .en:
            self.languageLabel.text = "Language: English"
        case .ja:
            self.languageLabel.text = "Language: Japan"
        }
        self.mediaTypeLabel.text = "Media type: " + data.mediaType.rawValue
        self.releaseDataLabel.text = "Release: " + data.releaseDate
        
        getGenres(listGenres: data.genreIDS) { genres in
            self.genreLabel.text = "Genres: "
            var countGenres = 0
            for genre in genres {
                self.genreLabel.text! += genre
                countGenres += 1
    
                if countGenres < genres.count {
                    self.genreLabel.text! += ", "
                }
            }
        }
        
        self.voteCountLabel.text = "Vote count: " + "\(data.voteCount)"
        self.voteAverageLabel.text = "Vote Average: " + "\(data.voteAverage)"
        
    }
}
