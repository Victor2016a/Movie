//
//  ApiService.swift
//  Rest API
//
//  Created by Victor Vieira on 07/02/22.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getPopularMoviesData(complention: @escaping (Result<MoviesData, Error>) -> Void) {
        
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/upcoming?api_key=69df030a50ccc58db4c288beaa4c218a"
        
        guard let url = URL(string: popularMoviesURL) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
            if let error = error {
                complention(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
             
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response Status Code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                complention(.success(jsonData))
            }catch let error {
                complention(.failure(error))
            }
        }
            
        }
        dataTask?.resume()
    }
}
