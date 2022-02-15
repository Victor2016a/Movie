//
//  MovieTableViewCell.swift
//  Rest API
//
//  Created by Victor Vieira on 07/02/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var moviePoster: UIImageView!
//    @IBOutlet weak var movieTitle: UILabel!
//    @IBOutlet weak var movieYear: UILabel!
//    @IBOutlet weak var movieOverview: UILabel!
//    @IBOutlet weak var movieRate: UILabel!
    
    private var moviePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieYear: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieOverview: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieRate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(moviePoster)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            moviePoster.topAnchor.constraint(equalTo: contentView.topAnchor),
//            moviePoster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moviePoster.heightAnchor.constraint(equalToConstant: 200),
            moviePoster.widthAnchor.constraint(equalToConstant: 130),
            moviePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ),
            moviePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor ),
            
           
            
            
        ])
        
        
        
    }
    
    private var urlString: String = ""
    
    //Setup Movies Values
    func setCellWithValuesOf(_ movie: Movie){
        updateUI(title: movie.title, releaseDate: movie.year, rating: movie.rate, overview: movie.overview, poster: movie.posterImage)
    }
    
    //Update the UI Views
    private func updateUI(title: String?, releaseDate: String?, rating: Double?, overview: String?, poster: String?){
        
//        self.movieTitle.text = title
//
//        self.movieYear.text = convertDateFormater(releaseDate)
//
//        guard let rate = rating else {return}
//        self.movieRate.text = String(rate)
        
//        self.movieOverview.text = overview
        
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString

        guard let posterImageURL = URL(string: urlString) else {
            self.moviePoster.image = UIImage(named: "noImageAvailable")
            return
        }

        //Before we download the image we clear out th old one
        self.moviePoster.image = nil

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
                    self.moviePoster.image = image
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
