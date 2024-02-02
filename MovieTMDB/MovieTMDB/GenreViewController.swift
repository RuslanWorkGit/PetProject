

import UIKit
import Alamofire

class GenreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayOfGenre: [Genre] = []
    
    let genreList = "https://api.themoviedb.org/3/genre/movie/list?api_key=bcfdb7391902da79ee3c28ea459c4d04"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request(genreList).responseDecodable(of: GenreList.self) { responce in
            switch responce.result {
            case .success(let genreList):
                self.arrayOfGenre = genreList.genres
                print(self.arrayOfGenre)
                self.tableView.reloadData()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
}

extension GenreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfGenre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayOfGenre[indexPath.row].name
        return cell
    }
    
    
}

