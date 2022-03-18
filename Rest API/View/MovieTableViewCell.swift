//
//  MovieTableViewCell.swift
//  Rest API
//
//  Created by Victor Vieira on 07/02/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    private var moviePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var movieTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieYear: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieOverview: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var starRating: UIImageView = {
        var image = UIImageView()
        image = UIImageView(image: UIImage(named: "ratedStar"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        contentView.addSubview(movieTitle)
        contentView.addSubview(movieYear)
        contentView.addSubview(movieOverview)
        contentView.addSubview(starRating)
        contentView.addSubview(movieRate)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            moviePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            moviePoster.heightAnchor.constraint(equalToConstant: 150),
            moviePoster.widthAnchor.constraint(equalToConstant: 100),
            moviePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            moviePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            movieTitle.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 10),
            movieTitle.trailingAnchor.constraint(equalTo: starRating.leadingAnchor, constant: -5),
            
            movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 5),
            movieYear.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 10),
            movieYear.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            movieOverview.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 10),
            movieOverview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            movieOverview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            starRating.heightAnchor.constraint(equalToConstant: 50),
            starRating.widthAnchor.constraint(equalToConstant: 50),
            starRating.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            movieRate.topAnchor.constraint(equalTo: starRating.bottomAnchor),
            movieRate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieRate.centerXAnchor.constraint(equalTo: starRating.centerXAnchor)
        ])
    }
    
    override func prepareForReuse() {
        moviePoster.image = nil
    }
    
    private var urlString: String = ""
    
    func setCellWithValuesOf(_ movie: Movie) { updateUI(
        title: movie.title,
        releaseDate: movie.year,
        rating: movie.rate,
        overview: movie.overview,
        poster: movie.posterImage)
        
    }
    
    private func updateUI(
        title: String?,
        releaseDate: String?,
        rating: Double?,
        overview: String?,
        poster: String?) {
        
        movieTitle.text = title
        movieYear.text = convertDateFormater(releaseDate)
            
        guard let rate = rating else { return }
        movieRate.text = String(rate)
        
        movieOverview.text = overview
        
        guard let posterString = poster else { return }
        urlString = "https://image.tmdb.org/t/p/w300" + posterString

        guard let posterImageURL = URL(string: urlString) else {
            moviePoster.image = UIImage(named: "noImageAvailable")
            return
        }
            
        downloadImageFrom(url: posterImageURL) { [weak self] (image, error) in
            self?.moviePoster.image = image
        }
    }
}
