//
//  loadImaged.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 29.04.2022.
//

import UIKit

final class CustomImageView : UIImageView {
    
    
    func loadImage(from url: URL) {
        
    self.image = UIImage(named: "loading")
//    self.image = nil
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("couldn't load image from \(url)")
                return
            }
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
