//
//  MovieDetailsViewController.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 07.02.2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    var movieDetailsViewModel: Movie?
    
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        
        guard let movieDetailsViewModel = movieDetailsViewModel else { return }
        
        let url = URL(string: (APIs.getImage.rawValue + movieDetailsViewModel.posterPath))
        posterImageView.kf.setImage(with: url)
        posterImageView.layer.cornerRadius = 25
        titleLabel.text = movieDetailsViewModel.title
        overviewTextView.text = movieDetailsViewModel.overview
        ratingLabel.text = "\(movieDetailsViewModel.voteAverage)"
    }
    

    @IBAction func favoriteButtonDidTap(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        let symbolName = sender.isSelected ? "star.fill" : "star"
        let image = UIImage(systemName: symbolName)
        sender.setImage(image, for: .normal)
    }
    
}
