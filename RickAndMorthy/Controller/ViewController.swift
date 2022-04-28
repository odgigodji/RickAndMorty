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

class ViewController: UIViewController {
    
    var listOfCharacters = [Result?]()
    
    var fetchedData : PostModel?
    
    private var url: String = "https://rickandmortyapi.com/api/character"
    private var page2: String = "https://rickandmortyapi.com/api/character?page=2"
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setTableView(on: tableView)
        url = page2
        fetchAllFromAPI(from: url)
        
    }
    
    func setTableView(on tableView: UITableView) {
        view.addSubview(tableView)
        
        setConstraints(on: tableView)
        registerCell(on: tableView)
    }
}

// MARK: - Navigation Controller configure
extension ViewController {
    
    func setNavigationItems() {
//        view.backgroundColor = .systemGreen
//        navigationItem.rightBarButtonItem?.title = "next"
        navigationItem.title = "Rick and Morty"
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "Image"), for: .default)
//        navigationController?.hidesBarsOnTap = true
//        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.navigationBar.backgroundColor = .systemGray5
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - tableview configurations
extension ViewController : UITableViewDataSource {
    
    //MARK: - set constraints
    private func setConstraints(on tableView: UITableView) {
        tableView.translatesAutoresizingMaskIntoConstraints = false //disable costr
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func registerCell(on tableView: UITableView) {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
    }
    
   //MARK: - set cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let fetchedData = self.fetchedData else { return 0 }
//        guard let listOfCharacters = fetchedData.result else { return 0 }
        return listOfCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id")
        guard let name = listOfCharacters[indexPath.row] else {
            return UITableViewCell()
        }

        cell?.textLabel?.text = name.name

        return cell ?? UITableViewCell()
    }
}

// MARK: - network service
extension ViewController {
    func fetchAllFromAPI(from url: String) {
        let anonymousFunction = { (fetchedData: PostModel?) in
            DispatchQueue.main.async {
                self.fetchedData = fetchedData
                
//                print("-inFetchAllfromAPI")
                print(self.fetchedData!.info)
//                print("------")
//                print(self.fetchedData!.results)
                
                self.listOfCharacters = fetchedData!.results!
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
