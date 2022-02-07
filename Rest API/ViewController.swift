//
//  ViewController.swift
//  Rest API
//
//  Created by Victor Vieira on 06/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getPopularMoviesData { (result) in
            print(result)
        }
        
    }


}

