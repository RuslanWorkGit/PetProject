
import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfData: [FilmInfo]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=bcfdb7391902da79ee3c28ea459c4d04"
        
        AF.request(url).responseDecodable(of: Trends.self) { response in
            
            switch response.result {
                case .success(let trends):
                    self.arrayOfData = trends.results
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error: \(error)")
                    // Handle error here
                }
            
            //self.arrayOfData = response.value?.results
            let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: "MovieTableViewCell")
//            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: arrayOfData![indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieInfo = arrayOfData?[indexPath.row] else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "FilmTapViewController") as? FilmTapViewController {
            viewController.arrayOfData = movieInfo
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
