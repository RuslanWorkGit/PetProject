
import Foundation
import Alamofire

//func getMovieGenre(url: String, completion: @escaping ([Genre]) -> Void) {
//    var arrayOfMovie: [GenreMovie] = []
//    
//    AF.request(url).responseDecodable(of: GenreMovie.self) { response in
//        switch response.result {
//        case .success(let movieGenreList):
//            arrayOfMovie = movieGenreList.results
//            //print(genreList.genres)
//        case .failure(let error):
//            arrayOfMovie = []
//            print("Error: \(error)")
//        }
//        
//        completion(arrayOfMovie)
//    }
//}
