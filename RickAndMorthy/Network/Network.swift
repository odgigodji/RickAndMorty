//
//  Character.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 25.04.2022.
//

import Foundation

final class  Network {
    
    static let shared = Network()
    
    func fetchPostModel(url: String, onCompletion: @escaping (PostModel?) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            guard let PostModel = try? JSONDecoder().decode(PostModel.self, from: data) else {
                    print("couldn't decode JSON")
                return
            }
            onCompletion(PostModel)
        }
        task.resume()
    }
    
    func fetchResult(url: String, onCompletion: @escaping (Result?) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            guard let character = try? JSONDecoder().decode(Result.self, from: data) else {
                    print("couldn't decode JSON")
                return
            }
            onCompletion(character)
        }
        task.resume()
    }
}
