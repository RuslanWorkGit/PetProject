import UIKit
import Alamofire
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var currentPage = 1
    var arrayOfMovieRealm: Results<MovieRealm>!
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.themoviedb.org/3/trending/movie/week?language=en-US&api_key=bcfdb7391902da79ee3c28ea459c4d04"
        
        AF.request(url).responseDecodable(of: TrendingModels.self) { responce in
            switch responce.result {
            case .success(let listOfMovie):
                print(listOfMovie.results.count)
                self.saveData(medias: listOfMovie.results)
                self.arrayOfMovieRealm = self.realm.objects(MovieRealm.self)
                
                self.tableView.reloadData()
                
            case .failure(let error):
                print("Error \(error)")
            }
            
        }
        
    }
    
    private func saveData(medias: [Movie]?) {
        
        guard let medias = medias, !medias.isEmpty else {
            return
        }
        
        // Очистка бази даних перед додаванням нових даних
        try? realm.write {
            realm.deleteAll()
        }
        
        
        try? realm.write({
            for media in medias {
                let movieRealm = MovieRealm()
                
                movieRealm.id = media.id
                movieRealm.adult = media.adult
                movieRealm.backdropPath = media.backdropPath
                movieRealm.title = media.title
                movieRealm.originalLanguage = media.originalLanguage.rawValue
                movieRealm.originalTitle = media.originalTitle
                movieRealm.overview = media.overview
                movieRealm.posterPath = media.posterPath
                movieRealm.mediaType = media.mediaType.rawValue
                movieRealm.genreIDS = media.genreIDS.first!
                movieRealm.popularity = media.popularity
                movieRealm.releaseDate = media.releaseDate
                movieRealm.video = media.video
                movieRealm.voteAverage = media.voteAverage
                movieRealm.voteCount = media.voteCount
                
                realm.add(movieRealm, update: .all)
            }
        })
        
        tableView.reloadData()
    }
    
    private func loadNextPage() {
        currentPage += 1
        fetchDataForPage(currentPage)
    }
    
    private func fetchDataForPage(_ page: Int) {
        let url = "https://api.themoviedb.org/3/trending/movie/week?language=en-US&api_key=bcfdb7391902da79ee3c28ea459c4d04&page=\(page)"

        AF.request(url).responseDecodable(of: TrendingModels.self) { response in
            switch response.result {
            case .success(let listOfMovie):
                self.saveData(medias: listOfMovie.results)
                self.arrayOfMovieRealm = self.realm.objects(MovieRealm.self)
                self.tableView.reloadData()

            case .failure(let error):
                print("Error \(error)")
            }
        }
    }

    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfMovieRealm?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        let currentMovie = arrayOfMovieRealm[indexPath.row]
        cell.textLabel?.text = currentMovie.title
        return cell
        
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offset = scrollView.contentOffset.y
        let contentHeight  = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offset >= contentHeight - height {
            loadNextPage()
        }
    }
}

