//
//  GenresViewController.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 06.02.2024.
//

import UIKit

class GenresViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "GenreTableViewCell", bundle: nil), forCellReuseIdentifier: "GenreTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GenresNetworkManager.shared.getMovieGenres { [weak self] genres in
            MovieDataStore.shared.arrayOfGenre = genres
            self?.tableView.reloadData()
        }
        
    }
}

extension GenresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MovieDataStore.shared.arrayOfGenre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GenreTableViewCell") as? GenreTableViewCell else { return UITableViewCell()}
        
        cell.configure(genre: MovieDataStore.shared.arrayOfGenre[indexPath.row], navigationController: self.navigationController!)
        cell.genreCollectionView.reloadData()
        return cell
    }
    
    
}
