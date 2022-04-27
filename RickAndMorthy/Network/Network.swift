//
//  Character.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 25.04.2022.
//

import Foundation

final class  Network {
    
    static let shared = Network()
    
    func fetchNewsList(onCompletion: @escaping ([Result]?) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            guard let ListOfCharacters = try? JSONDecoder().decode(PostModel.self, from: data) else {
                    print("couldn't decode JSON")
                return
            }
            onCompletion(ListOfCharacters.results)
        }
        task.resume()
    }
}


