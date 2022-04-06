//
//  MovieDetailsViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 16/02/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private let movieDetails: Movie
    
    private var baseView = MovieDetailsView()
    
    init(movieDetails: Movie) {
        self.movieDetails = movieDetails
        super.init(nibName: nil, bundle: nil )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        getImage(poster: movieDetails.posterImage)
        baseView.movieRate.text = "Rating: " + String(format: "%.1f", movieDetails.rate ?? "")
        baseView.movieYear.text = movieDetails.year
        baseView.movieOverview.text = movieDetails.overview
        view = baseView
        pressBuyButton()
    }
    
    private func pressBuyButton() {
        baseView.buttonBuy.addTarget(self, action: #selector(alertConfirm), for: .touchUpInside)
    }
    
    @objc private func alertConfirm() {
        let alert = UIAlertController(title: "You Bought \(movieDetails.title ?? "")", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    private func getImage(poster: String?) {
        
        guard let posterString = poster else { return }
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            baseView.moviePoster.image = UIImage(named: "noImageAvailable")
            return
        }
      ImageProvider.shared.fecthImage(
        url: posterImageURL) { [weak self] image in
          self?.baseView.moviePoster.image = image
        }
    }
}
