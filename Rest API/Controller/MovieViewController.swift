//
//  ViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 06/02/22.
//

import UIKit

class MovieViewController: UIViewController {
    
        
    private var tableViewMovieCode: UITableView = {
        let table = UITableView()
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: "cellcode")
        return table
    }()
    
    private var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitleView()
        loadUpComingMoviesData()
    }
    
    private func loadUpComingMoviesData(){
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.tableViewMovieCode.dataSource = self
            self?.tableViewMovieCode.delegate = self
            self?.tableViewMovieCode.reloadData()
        }
    }
    
    func addTitleView(){
        let labelTitle = UILabel()
        
        labelTitle.text = "Popular Movies"
        labelTitle.backgroundColor = .black
        labelTitle.textColor = .white
        labelTitle.font = .boldSystemFont(ofSize: 30)
        labelTitle.textAlignment = .center
        
        view.addSubview(labelTitle)
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellcode", for: indexPath) as! MovieTableViewCell
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
    }

    
}

