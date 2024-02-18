//
//  MainViewModel.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 16.02.2024.
//

import Foundation

class MainViewModel {
    
    func numbeOfSection() -> Int {
        1
    }
    
    func numberOfRows(in sections: Int) -> Int {
        10
    }
    
    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top trending Counts: \(data.results.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
