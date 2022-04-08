//
//  Coordinator.swift
//  Rest API
//
//  Created by Victor Vieira on 08/04/22.
//

import Foundation
import UIKit

enum Event {
  case pressMovieCell(movieDetails: Movie)
}

protocol Coordinator {
  var navigationController: UINavigationController? { get set }
  func eventOccured(with type: Event)
  func start()
}

protocol Coordinating {
  var coordinator: Coordinator? { get set }
}
