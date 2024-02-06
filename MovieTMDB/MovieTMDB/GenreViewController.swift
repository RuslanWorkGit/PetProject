

import UIKit
import Alamofire

class GenreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayOfGenre: [Genre] = []
    var selectedMovies: [GenreMovie] = []
    let selectedGenre: Genre = .init(id: 0, name: "")
    
    let genreList = "https://api.themoviedb.org/3/genre/movie/list?api_key=bcfdb7391902da79ee3c28ea459c4d04"
    
    let movieList = "https://api.themoviedb.org/3/discover/movie?api_key=bcfdb7391902da79ee3c28ea459c4d04&with_genres=28"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getGenre(url: genreList) { [weak self] genres in
            MovieDataStore.shared.arrayOfGenre = genres
            self?.tableView.reloadData()
        }
        
        NetworkManager.shared.getMovieGenre(url: movieList) { [weak self] movies in
            MovieDataStore.shared.selectedMovies = movies
            self?.tableView.reloadData()
        }
        
        let nib = UINib(nibName: "GenreTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "GenreTableViewCell")
        
        
    }
    
}

extension GenreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MovieDataStore.shared.arrayOfGenre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GenreTableViewCell", for: indexPath) as? GenreTableViewCell else {
            return UITableViewCell()
        }
        
        let selectedGenre = MovieDataStore.shared.arrayOfGenre[indexPath.row]
        cell.genreLabel.text = selectedGenre.name
        cell.movieList.reloadData()
        
        return cell
    }
    
    
}

