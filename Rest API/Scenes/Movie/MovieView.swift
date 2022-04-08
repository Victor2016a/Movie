//
//  MovieView.swift
//  Rest API
//
//  Created by Victor Vieira on 17/02/22.
//

import UIKit
import NVActivityIndicatorView

class MovieView: UIView {
  var tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()
  
  let spinner: NVActivityIndicatorView = {
    let spinner = NVActivityIndicatorView(frame: .zero, type: .ballPulse, color: .lightGray, padding: .none)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    return spinner
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews(){
    backgroundColor = .white
    addSubview(tableView)
    spinner.startAnimating()
    addSubview(spinner)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
      spinner.widthAnchor.constraint(equalToConstant: 70),
      spinner.heightAnchor.constraint(equalToConstant: 70)
    ])
  }
}
