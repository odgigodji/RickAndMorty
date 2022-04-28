//
//  Character.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 25.04.2022.
//

import Foundation

final class  Network {
    
    static let shared = Network()
    
    var fetchedData: PostModel?
    
    fileprivate var url: String = "https://rickandmortyapi.com/api/character"
    
//    func fetchCharactersList(onCompletion: @escaping ([Result]?) -> ()) {
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
    
    
    func fetchPostModel(onCompletion: @escaping (PostModel?) -> ()) {
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
    
    
    func changeUrl() {
        guard let data = fetchedData else { return }
        guard let info = data.info else { return }
        guard let next = info.next else { return }
//        self.url = next
//        print("URL - \(url)")
    }
}

//extension ViewController {
//    func fetchDataFromAPI() {
//        let anonymousFunction = { (fetchedCharacterList: [Result]?) in
//            DispatchQueue.main.async {
//                self.listOfCharacters = fetchedCharacterList!
//
////                print(fetchedCharacterList)
//
//                self.tableView.reloadData()
//            }
//        }
//        Network.shared.fetchCharactersList(onCompletion: anonymousFunction)
//        self.tableView.reloadData()
//    }
//}


extension ViewController {
    func fetchAllFromAPI() {
        let anonymousFunction = { (fetchedData: PostModel?) in
            DispatchQueue.main.async {
                self.fetchedData = fetchedData
                
                print("-inFetchAllfromAPI")
                print(self.fetchedData!.info)
                print("------")
                print(self.fetchedData!.results)
                
                self.listOfCharacters = fetchedData!.results!
//                Network.shared.url = fetchedData!.info.!next
                
//                Network.shared.changeUrl()
                print("AFTER URL CHANGE")
                print(self.fetchedData!.results)
                    
                self.tableView.reloadData()
            }
        }
        Network.shared.fetchPostModel(onCompletion: anonymousFunction)
        self.tableView.reloadData()
    }
}



