//
//  MovieDetailsView.swift
//  Rest API
//
//  Created by Victor Vieira on 17/02/22.
//

import UIKit

class MovieDetailsView: UIView {
    
    var moviePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var movieTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movieYear: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movieOverview: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movieRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonBuy: UIButton = {
        let buttonBuy = UIButton()
        buttonBuy.setTitle("BUY NOW", for: .normal)
        buttonBuy.setTitleColor(.white, for: .normal)
        buttonBuy.backgroundColor = .blue
        buttonBuy.translatesAutoresizingMaskIntoConstraints = false
        return buttonBuy
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(moviePoster)
        addSubview(movieYear)
        addSubview(movieRate)
        addSubview(movieOverview)
        addSubview(buttonBuy)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            moviePoster.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            moviePoster.heightAnchor.constraint(equalToConstant: 300),
            moviePoster.widthAnchor.constraint(equalToConstant: 200),
            
            buttonBuy.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            buttonBuy.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonBuy.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonBuy.heightAnchor.constraint(equalToConstant: 50),
            
            movieOverview.bottomAnchor.constraint(equalTo: buttonBuy.topAnchor, constant: -20),
            movieOverview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            movieOverview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            movieOverview.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 20),

            movieYear.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            movieYear.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
            movieYear.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),

            movieRate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            movieRate.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
            movieRate.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 20)
        ])
    }
    
   
}
