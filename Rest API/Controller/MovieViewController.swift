//
//  ViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 06/02/22.
//

import UIKit

class MovieViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    
    private var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadUpComingMoviesData()
    }
    
    
    private func loadUpComingMoviesData(){
        viewModel.fetchPopularMoviesData { [weak self] in
            
            self?.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
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
    
}

