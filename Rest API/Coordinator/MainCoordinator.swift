//
//  MainCoordinator.swift
//  Rest API
//
//  Created by Victor Vieira on 08/04/22.
//

import UIKit

class MainCoordinator: Coordinator {
  var navigationController: UINavigationController?
  
  func eventOccured(with type: Event) {
    switch type {
    case .pressMovieCell(let movieDetails):
      let viewController = MovieDetailsViewController(movieDetails: movieDetails)
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
  
  func start() {
    var viewControllerMovie: UIViewController & Coordinating = MovieViewController()
    viewControllerMovie.coordinator = self
    navigationController?.setViewControllers([viewControllerMovie], animated: false)
  }
}
