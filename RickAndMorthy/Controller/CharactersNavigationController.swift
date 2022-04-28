//
//  ViewController.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 23.04.2022.
//

//Использовать общедоступный API https://rickandmortyapi.com/documentation/#rest
//1 экран - отображение списка персонажей Рик и Морти, используя соответствующий метод API. Будет плюсом, если сможете реализовать постраничную загрузку персонажей в списке.
//Для каждого персонажа в ячейке списка должно отображаться имя, раса, пол, аватарка.

//По тапу на ячейку списка должен открываться экран детальной информации о персонаже (2 экран). При открытии этого экрана должна происходить загрузка детальной информации о выбранном персонаже, используя соответствующий метод API.
//На экране детальной информации о персонаже должно отображаться имя, раса, пол, статус, аватарка, последнее известное местоположение, кол-во эпизодов, в которых упоминался данный персонаж.

import UIKit

final class CharactersNavigationController: UIViewController {
    
//MARK: - list of constants
    
    var listOfCharacters = [Result?]()
    var info : Info?
    var fetchedData : PostModel?
    private var url: String = "https://rickandmortyapi.com/api/character"
    private var page2: String = "https://rickandmortyapi.com/api/character?page=2"
    private let tableView = UITableView(frame: .zero, style: .grouped)

//MARK: - MainController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationItems()
        self.setTableView(on: tableView)
        self.fetchAllFromAPI(from: url)
    }
    
    private func setTableView(on tableView: UITableView) {
        view.addSubview(tableView)
        self.setConstraints(on: tableView)
        self.registerCell(on: tableView)
    }
    
    private func setNavigationItems() {
        self.setNavigationBar()
        self.setNavigationBarButtons()
    }
}


// MARK: - Navigation Controller configure
extension CharactersNavigationController {
    
    private func setNavigationBar() {
        navigationItem.title = "Rick and Morty"
    }
    
    private func setNavigationBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next page", style: .plain, target: self, action: #selector(nextPageTapped))

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Prev page", style: .plain, target: self, action: #selector(prevPageTapped))
    }
    
    @objc func nextPageTapped() {
        guard let nextPage = info!.next else {
            return
        }
        fetchAllFromAPI(from: nextPage)
    }
    
    @objc func prevPageTapped() {
        fetchAllFromAPI(from: url)
    }
}


//MARK: - tableview configurations
extension CharactersNavigationController : UITableViewDataSource {
    
    //MARK: - set constraints
    private func setConstraints(on tableView: UITableView) {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func registerCell(on tableView: UITableView) {
        tableView.dataSource = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        tableView.rowHeight = 150
    }
    
   //MARK: - table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let fetchedData = self.fetchedData else { return 0 }
//        guard let listOfCharacters = fetchedData.result else { return 0 }
        return listOfCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as! CharacterCell
        guard let character = listOfCharacters[indexPath.row] else {
            return CharacterCell()
        }
        
        cell.fillCharacterCell(from: character)
        
        return cell
    }
}


// MARK: - network service
extension CharactersNavigationController {
    func fetchAllFromAPI(from url: String) {
        let anonymousFunction = { (fetchedData: PostModel?) in
            DispatchQueue.main.async {
//                self.fetchedData = fetchedData
                
//                print("-inFetchAllfromAPI")
//                print(self.fetchedData!.info)
//                print("------")
//                print(self.fetchedData!.results)
                
                self.listOfCharacters = fetchedData!.results!
                self.info = fetchedData!.info
//                Network.shared.url = fetchedData!.info!.next
                
//                Network.shared.changeUrl()
//                print("AFTER URL CHANGE")
//                print(self.fetchedData!.results)
                    
                self.tableView.reloadData()
            }
        }
        Network.shared.fetchPostModel(url: url, onCompletion: anonymousFunction)
        self.tableView.reloadData()
    }
}
