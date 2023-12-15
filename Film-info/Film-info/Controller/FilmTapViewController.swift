//
//  FilmTapViewController.swift
//  Film-info
//
//  Created by Ruslan Liulka on 13.12.2023.
//

import UIKit

class FilmTapViewController: UIViewController {
    
    var arrayOfData: FilmInfo?
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var mediaTypeLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var voteCounteLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .systemRed
        return sv
    }()
    
    private let contentView: UIView = {
        let sv = UIView()
        sv.backgroundColor = .systemPurple
        return sv
    }()
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.overviewLabel.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = arrayOfData else { return }
        
        let basePath = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: basePath + data.posterPath)
        if let url = url {
            downloadImage(from: url, variableName: posterImageView)
        }
        
        idLabel.text = "id: " + "\(data.id)"
        titleLabel.text = data.title
        originalTitleLabel.text = data.originalTitle
        
        switch data.originalLanguage {
        case .en:
            languageLabel.text = "Language: English"
        case .ja:
            languageLabel.text = "Language: Japan"
        }
        
        switch data.adult {
        case true: adultLabel.text = "Film for 18+"
        case false: adultLabel.text = "Kids can see it"
        }
        
        mediaTypeLabel.text = "Media type: " + data.mediaType.rawValue
        
        getGenres(listGenres: data.genreIDS) { genres in
            self.genresLabel.text = "Genres: "
            var count = 0
            for genre in genres {
                self.genresLabel.text! += genre
                count += 1
                if count < genres.count {
                    self.genresLabel.text! += ", "
                }
            }
        }
        
        releaseLabel.text = "Release: " + data.releaseDate
        voteCounteLabel.text = "Vote count: " + "\(data.voteCount)"
        voteAverageLabel.text = "Vote average: " + "\(data.voteAverage)"
        overviewLabel.text = data.overview
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
    

}
