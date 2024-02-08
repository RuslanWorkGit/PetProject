//
//  GenreCollectionViewCell.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 06.02.2024.
//

import UIKit
import Kingfisher



class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configure(with movieByGenre: Movie) {
        
//        let url = URL(string: (APIs.getImage.rawValue + movieByGenre.posterPath))
//        posterImageView.kf.setImage(with: url)
        
        let url = URL(string: (APIs.getImage.rawValue + movieByGenre.posterPath ))
        let processor = DownsamplingImageProcessor(size: posterImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        posterImageView.kf.indicatorType = .activity
        posterImageView.kf.setImage(
            with: url,
        placeholder: UIImage(named: "placeHolderImage"),
        options: [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
            
        ],
            completionHandler: { result in
                switch result {
                case .success(let value):
                    print("Image size: \(value.image.size)")
                case .failure(let error):
                    print("Error loading image: \(error)")
                }
            })
        
        self.movieNameLabel.text = movieByGenre.title
        
    }
    


}

