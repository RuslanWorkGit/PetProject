//
//  NetworkService.swift
//  TestCleanSwift
//
//  Created by Ruslan Liulka on 30.04.2025.
//

import Foundation

struct ProductStruct: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}








struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count, pages: Int
    let next: String
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchData(completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            if let responseError = error {
                completion(.failure(responseError))
                print("Error: \(responseError)")
            }
            
            guard let responseData = data else {
                completion(.failure(NSError(domain: "NoData", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(CharacterResponse.self, from: responseData)
                print(decodedData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
