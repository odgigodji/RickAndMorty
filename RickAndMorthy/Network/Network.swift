//
//  Character.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 25.04.2022.
//

import Foundation

final class  Network {
    
    static let shared = Network()
    
    private var url: String = "https://rickandmortyapi.com/api/character"
    
    func fetchCharactersList(onCompletion: @escaping ([Result]?) -> ()) {
        guard let url = URL(string: url) else {
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
    
    
//    func fetchCharactersList(onCompletion: @escaping (PostModel?) -> ()) {
//        guard let url = URL(string: url) else {
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else {
//                print("data was nil")
//                return
//            }
//            guard let ListOfCharacters = try? JSONDecoder().decode(PostModel.self, from: data) else {
//                    print("couldn't decode JSON")
//                return
//            }
//            onCompletion(ListOfCharacters.results)
//        }
//        task.resume()
//    }
}

extension ViewController {
    func fetchDataFromAPI() {
        let anonymousFunction = { (fetchedCharacterList: [Result]?) in
            DispatchQueue.main.async {
                self.listOfCharacters = fetchedCharacterList!
                
                print(fetchedCharacterList)
                
                self.tableView.reloadData()
            }
        }
        Network.shared.fetchCharactersList(onCompletion: anonymousFunction)
        self.tableView.reloadData()
    }
}


