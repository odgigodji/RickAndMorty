//
//  Character.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 25.04.2022.
//

import Foundation

final class  Network {
    
    static let shared = Network()
    
    func fetchNewsList(searchLabel: String, onCompletion: @escaping ([Character]) -> ()) {

        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            print("URL's with non English symbols are not working yet")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            
            guard let Characters = try? JSONDecoder().decode(Character.self, from: data) else {
                    print("couldn't decode JSON")
                return
            }
            
//            onCompletion(ListOfCharacters.)

        }
        
        task.resume()
    }
    
}


