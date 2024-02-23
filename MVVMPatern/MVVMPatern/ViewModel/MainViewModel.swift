//
//  MainViewModel.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 16.02.2024.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(value: false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(value: nil)
    var dataSource: TrendingMoviesModel?
    
    func numbeOfSection() -> Int {
        1
    }
    
    func numberOfRows(in sections: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top trending Counts: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
//        self.cellDataSource.value = self.dataSource?.results ?? []
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func retriveMovie( with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: { $0.id == id }) else {
            return nil
        }
        
        return movie
    }
}
