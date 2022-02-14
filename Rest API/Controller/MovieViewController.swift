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
        
        loadUpComingMoviesData()
    }
    
    private func loadUpComingMoviesData(){
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.delegate = self
            self?.tableView.reloadData()
        }
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

