//
//  ViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 06/02/22.
//

import UIKit

class MovieViewController: UIViewController, Coordinating {
  var coordinator: Coordinator?
  var baseView = MovieView()
  private var viewModel = MovieViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Now Playing"
    configureTableView()
    loadUpComingMoviesData()
  }
  
  override func loadView() {
    view = baseView
  }
  
  private func loadUpComingMoviesData() {
    self.viewModel.fetchPopularMoviesData { [weak self] in
      self?.baseView.tableView.reloadData()
      self?.baseView.spinner.stopAnimating()
    }
  }
  
  private func configureTableView() {
    baseView.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
    baseView.tableView.dataSource = self
    baseView.tableView.delegate = self
  }
}

extension MovieViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return .init() }
    let movie = viewModel.cellForRowAt(indexPath: indexPath)
    cell.setCellWithValuesOf(movie)
    return cell
  }
}

extension MovieViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movieDetails = viewModel.cellForRowAt(indexPath: indexPath)
    coordinator?.eventOccured(with: .pressMovieCell(movieDetails: movieDetails))
  }
}

