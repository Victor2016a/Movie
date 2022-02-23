//
//  GetImage.swift
//  Rest API
//
//  Created by Victor Vieira on 21/02/22.
//

import UIKit

//func getImagePoster(poster: String?, moviePoster: UIImageView?) {
//    
//    var urlString = ""
//    
//    guard let posterString = poster else { return }
//    urlString = "https://image.tmdb.org/t/p/w300" + posterString
//    
//    guard let posterImageURL = URL(string: urlString) else {
//        moviePoster?.image = UIImage(named: "noImageAvailable")
//        return
//    }
//    getImageDataFrom(url: posterImageURL)
//}
//
//func getImageDataFrom(url: URL) {
//    
//URLSession.shared.dataTask(with: url) { (data, response, error) in
//        
//    DispatchQueue.main.async {
//            
//        if let error = error {
//            print("DataTask error: \(error.localizedDescription) ")
//            return
//        }
//        
//        guard let data = data else {
//            print("Empty Data")
//            return
//        }
//        
//        if let image = UIImage(data: data){
//            moviePoster?.image = image
//        }
//    }
//}.resume()
//    
//}
