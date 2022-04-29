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
    var pages : Pages?
    var fetchedData : PostModel?
    private var startUrl: String = "https://rickandmortyapi.com/api/character"
    private let tableView = UITableView(frame: .zero, style: .grouped)

//MARK: - NavigationController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationItems()
        self.setTableView(on: tableView)
        self.fetchAllData(from: startUrl)
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
        view.backgroundColor = .white
        navigationItem.title = "Rick and Morty"
    }
    
    private func setNavigationBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next page", style: .plain, target: self, action: #selector(nextPageTapped))

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(prevPageTapped))
    }
    
    @objc func nextPageTapped() {
        guard let nextPage = pages!.next else {
            navigationItem.rightBarButtonItem?.title = ""
            return
        }
        navigationItem.leftBarButtonItem?.title = "Prev page"
        fetchAllData(from: nextPage)
//        sleep(1)
    }
    
    @objc func prevPageTapped() {
        guard let prevPage = pages!.prev else {
            navigationItem.leftBarButtonItem?.title = ""
            return
        }
        navigationItem.rightBarButtonItem?.title = "Next page"
        fetchAllData(from: prevPage)
//        sleep(1)
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
        tableView.delegate = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        tableView.rowHeight = 350
    }
    
   //MARK: - table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

// MARK: - UITableViewDelegate
extension CharactersNavigationController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailView(on: indexPath)
    }
    
    private func goToDetailView(on indexPath: IndexPath) {
        guard let character = listOfCharacters[indexPath.row] else {
            return
        }
//        let newVC = DetailVC(about: character, rootViewController: self)
        let newVC = DetailVC()
        newVC.character = character
        
        self.present(newVC, animated: true)
//        print(name)
    }
}

// MARK: - network service
extension CharactersNavigationController {
    func fetchAllData(from url: String) {
        let anonymousFunction = { (fetchedData: PostModel?) in
            DispatchQueue.main.async {
                self.listOfCharacters = fetchedData!.results!
                self.pages = fetchedData!.info
                self.tableView.reloadData()
            }
        }
        Network.shared.fetchPostModel(url: url, onCompletion: anonymousFunction)
//        print("data is feched")
//        self.tableView.reloadData()
    }
}
