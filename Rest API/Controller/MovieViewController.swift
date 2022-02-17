//
//  ViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 06/02/22.
//

import UIKit

class MovieViewController: UIViewController {
            
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    
    private var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadUpComingMoviesData()
    }
    
    override func loadView() {
        super.loadView()
        setupViews()
        setupConstraints()
    }
    
    private func loadUpComingMoviesData(){
        viewModel.fetchPopularMoviesData { [weak self] in
            
            self?.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViews(){
        title = "Popular Movies"
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetails = viewModel.cellForRowAt(indexPath: indexPath)
        let movieDetailsVC = MovieDetailsViewController(movieDetails: movieDetails)
        movieDetailsVC.view.backgroundColor = .white
        movieDetailsVC.title = movieDetails.title
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }

    
}

