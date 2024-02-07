//
//  GenreTableViewCell.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 06.02.2024.
//

import UIKit

class GenreTableViewCell: UITableViewCell {
    
    var navigationController: UINavigationController?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView! {
        didSet {
            genreCollectionView.delegate = self
            genreCollectionView.dataSource = self
            genreCollectionView.register(UINib(nibName: "GenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenreCollectionViewCell")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(genre: Genre, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.titleLabel.text = genre.name
        GenresNetworkManager.shared.getMovie(with: String(genre.id)) { movies in
            MovieDataStore.shared.selectedMovies = movies
            self.genreCollectionView.reloadData()
        }
    }
 
}

extension GenreTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MovieDataStore.shared.selectedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = genreCollectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as? GenreCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: MovieDataStore.shared.selectedMovies[indexPath.row])
        return cell
    }
}

extension GenreTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            viewController.movieDetailsViewModel = MovieDataStore.shared.selectedMovies[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
