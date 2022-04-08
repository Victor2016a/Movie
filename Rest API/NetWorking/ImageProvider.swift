//
//  GetImage.swift
//  Rest API
//
//  Created by Victor Vieira on 21/02/22.
//

//
//  GetImage.swift
//  Weather
//
//  Created by Victor Vieira on 16/03/22.
//

import UIKit

class ImageProvider {
  static let shared = ImageProvider()
  
  private let cache = NSCache<NSString, UIImage>()
  
  private init() {}
  
  func fecthImage(url: URL, completion: @escaping (UIImage?) -> Void) {
    if let image = cache.object(forKey: url.absoluteString as NSString) {
      completion(image)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _ , error in
      guard let data = data, error == nil else {
        completion(nil)
        return
      }
      
      DispatchQueue.main.async {
        guard let image = UIImage(data: data) else {
          completion(nil)
          return
        }
        self?.cache.setObject(image, forKey: url.absoluteString as NSString)
        completion(image)
      }
    }
    task.resume()
  }
}
