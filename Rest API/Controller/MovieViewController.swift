//
//  ViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 06/02/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    var baseView = MovieView()
    
    private var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadUpComingMoviesData()
    }
    
    override func loadView() {
        title = "Popular Movies"
        view = baseView
    }
    
    private func loadUpComingMoviesData(){
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.baseView.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        baseView.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        baseView.tableView.dataSource = self
        baseView.tableView.delegate = self
    }

}

extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
    }

    
}

extension MovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetails = viewModel.cellForRowAt(indexPath: indexPath)
        let movieDetailsVC = MovieDetailsViewController(movieDetails: movieDetails)
        movieDetailsVC.view.backgroundColor = .white
        movieDetailsVC.title = movieDetails.title
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
}

