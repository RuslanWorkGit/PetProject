//
//  NetworkService.swift
//  CleanSwiftTest
//
//  Created by Ruslan Liulka on 02.05.2025.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [CharacterStruct]
}

struct Info: Codable {
    let count: Int
    let pages: Int
}

struct CharacterStruct: Codable {
    let id: Int
    let name: String
    let image: String
}

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchCharacter<T: Codable>(type: T.Type, id: Int? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        var urlString = "https://rickandmortyapi.com/api/character"
        
        if let id = id {
            urlString += "/\(id)"
            print(urlString)
        }
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("ERROR: \(error)")
            }
            
            guard let responseData = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: responseData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
