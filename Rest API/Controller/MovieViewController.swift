//
//  ViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 06/02/22.
//

import UIKit

class MovieViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Movies"
        label.textColor = .white
        label.backgroundColor = .black
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
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
    
    private func setupViews(){
        view.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            
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
    
}

