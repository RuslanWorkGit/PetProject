

import Foundation
import Alamofire


//func getGenre(url: String) -> [Genre] {
//    var arrayOfGenre: [Genre] = []
//    
//    AF.request(url).responseDecodable(of: GenreList.self) { responce in
//        switch responce.result {
//        case .success(let genreList):
//            arrayOfGenre = genreList.genres
//            print(genreList.genres)
//        case .failure(let error):
//            arrayOfGenre = []
//            print("Error: \(error)")
//        }
//    }
//    return arrayOfGenre
//}

//func getGenre(url: String, completion: @escaping ([Genre]) -> Void) {
//    var arrayOfGenre: [Genre] = []
//    
//    AF.request(url).responseDecodable(of: GenreList.self) { response in
//        switch response.result {
//        case .success(let genreList):
//            arrayOfGenre = genreList.genres
//            print(genreList.genres)
//        case .failure(let error):
//            arrayOfGenre = []
//            print("Error: \(error)")
//        }
//        
//        completion(arrayOfGenre)
//    }
//}
