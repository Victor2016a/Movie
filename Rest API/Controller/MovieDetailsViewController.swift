//
//  MovieDetailsViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 16/02/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private let movieDetails: Movie
    
    init(movieDetails: Movie) {
        self.movieDetails = movieDetails
        super.init(nibName: nil, bundle: nil )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

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
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieOverview: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonBuy: UIButton = {
        let buttonBuy = UIButton()
        buttonBuy.setTitle("BUY NOW", for: .normal)
        buttonBuy.setTitleColor(.white, for: .normal)
        buttonBuy.backgroundColor = .blue
        buttonBuy.translatesAutoresizingMaskIntoConstraints = false
        return buttonBuy
    }()
    
    
    private var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        getImage(poster: movieDetails.posterImage)
        movieRate.text = "Rating: " + String(format: "%.1f", movieDetails.rate ?? "")
        movieYear.text = movieDetails.year
        movieOverview.text = movieDetails.overview
        
        
        view.addSubview(moviePoster)
        view.addSubview(movieYear)
        view.addSubview(movieRate)
        view.addSubview(movieOverview)
        view.addSubview(buttonBuy)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            moviePoster.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            moviePoster.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            moviePoster.heightAnchor.constraint(equalToConstant: 300),
            moviePoster.widthAnchor.constraint(equalToConstant: 200),
            
            buttonBuy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonBuy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonBuy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonBuy.heightAnchor.constraint(equalToConstant: 50),
            
            movieOverview.bottomAnchor.constraint(equalTo: buttonBuy.topAnchor, constant: -20),
            movieOverview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieOverview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieOverview.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 20),

            movieYear.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieYear.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
            movieYear.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            movieRate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieRate.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
            movieRate.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 20)
        ])
    }
    
    private func getImage(poster: String?) {
        
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString

        guard let posterImageURL = URL(string: urlString) else {
            self.moviePoster.image = UIImage(named: "noImageAvailable")
            return
        }
        
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
}
