//
//  MovieTableViewCell.swift
//  Rest API
//
//  Created by Victor Vieira on 07/02/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private var moviePosterImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    private var movieTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private var movieYearLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private var movieOverviewLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private var movieRateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var imageStar: UIImage = {
        let image = UIImage()
        return image
    }()
    
    
    
    private var urlString: String = ""
    
    //Setup Movies Values
    func setCellWithValuesOf(_ movie: Movie){
        updateUI(title: movie.title, releaseDate: movie.year, rating: movie.rate, overview: movie.overview, poster: movie.posterImage)
    }
    
    //Update the UI Views
    private func updateUI(title: String?, releaseDate: String?, rating: Double?, overview: String?, poster: String?){
        
        self.movieTitleLabel.text = title
        
        self.movieYearLabel.text = convertDateFormater(releaseDate)
        
        guard let rate = rating else {return}
        self.movieRateLabel.text = String(rate)
        
        self.movieOverviewLabel.text = overview
        
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.moviePosterImage.image = UIImage(named: "noImageAvailable")
            return
        }
        
        //Before we download the image we clear out th old one
        self.moviePosterImage.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    
    //MARK - Get Image Data
    private func getImageDataFrom(url: URL){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //Handle error
            if let error = error {
                print("DataTask error: \(error.localizedDescription) ")
                return
            }
            
            guard let data = data else {
                //Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    self.moviePosterImage.image = image
                }
            }
            
        }.resume()
        
    }
    
    //Mark - Convert date format
    func convertDateFormater(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate){
                dateFormatter.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }
    

}
