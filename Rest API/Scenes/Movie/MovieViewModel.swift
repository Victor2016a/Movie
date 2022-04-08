//
//  MovieViewModel.swift
//  Rest API
//
//  Created by Victor Vieira on 07/02/22.
//

import Foundation

class MovieViewModel {
  private var apiService = ApiService()
  private var popularMovies = [Movie]()
  
  func fetchPopularMoviesData(completion: @escaping() -> Void ){
    
    apiService.getPopularMoviesData { [weak self] (result) in
      switch result {
      case .success(let listOf):
        self?.popularMovies = listOf.movies
        completion()
        
      case .failure(let error):
        print("Error Processing json data: \(error)")
      }
    }
  }
  
  func numberOfRowsInSection(section: Int) -> Int {
    popularMovies.count
  }
  
  func cellForRowAt (indexPath: IndexPath) -> Movie {
    popularMovies[indexPath.row]
  }
}
