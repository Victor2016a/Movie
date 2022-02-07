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
        
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=4e@be2c22f7268edffde97481d49064a&language=en-US&page=1"
        
        guard let url = URL(string: popularMoviesURL) else {return}
        
        //Create Url Session - Work on the Background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //handle error
            if let error = error {
                complention(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
             
            guard let response = response as? HTTPURLResponse else {
                //Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response Status Code: \(response.statusCode)")
            
            guard let data = data else {
                //Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                //Parse the Data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                
                DispatchQueue.main.async {
                    complention(.success(jsonData))
                }
                
            }catch let error {
                complention(.failure(error))
            }
            
        }

        dataTask?.resume()
    }
    
}
