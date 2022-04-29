//
//  loadImaged.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 29.04.2022.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

final class CustomImageView : UIImageView {
    var task: URLSessionDataTask!
    let spinner = UIActivityIndicatorView(style: .medium)
    
    func loadImage(from url: URL) {
        
        self.image = nil
        addSpiner()
        
        if let task = task {
            task.cancel()
        }
    
        //MARK: - load image from cache
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            image = imageFromCache
            removeSpinner()
            return
        }
        
        //MARK: - URLSession
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("couldn't load image from \(url)")
                return
            }
            
            //MARK: - add image to cache
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self.image = newImage
                self.removeSpinner()
            }
        }
        task.resume()
    }
    
    //MARK: - set spinner
    private func addSpiner() {
        addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        spinner.startAnimating()
    }
    
    private func removeSpinner() {
        spinner.removeFromSuperview()
    }
}
