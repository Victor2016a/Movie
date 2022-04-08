//
//  MovieDetailsView.swift
//  Rest API
//
//  Created by Victor Vieira on 17/02/22.
//

import UIKit

class MovieDetailsView: UIView {
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private let contentView: UIView = {
    let contentView = UIView()
    contentView.translatesAutoresizingMaskIntoConstraints = false
    return contentView
  }()
  
  var moviePoster: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  var movieTitle: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var movieYear: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.textAlignment = .center
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
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(moviePoster)
    contentView.addSubview(movieYear)
    contentView.addSubview(movieRate)
    contentView.addSubview(movieOverview)
    contentView.addSubview(buttonBuy)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      moviePoster.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
      moviePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      moviePoster.heightAnchor.constraint(equalToConstant: 300),
      moviePoster.widthAnchor.constraint(equalToConstant: 200),
      
      buttonBuy.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
      buttonBuy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      buttonBuy.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      buttonBuy.heightAnchor.constraint(equalToConstant: 50),
      
      movieOverview.bottomAnchor.constraint(equalTo: buttonBuy.topAnchor, constant: -20),
      movieOverview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      movieOverview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      movieOverview.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 20),
      
      movieYear.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      movieYear.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
      movieYear.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
      
      movieRate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      movieRate.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
      movieRate.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 20)
    ])
  }
}
