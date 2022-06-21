//
//  ViewController.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 23.04.2022.
//

import UIKit

final class CharactersTableViewController: UITableViewController {
    
//MARK: - list of constants
    
    let cellId = "CharacterCell"
    var listOfCharacters = [Result?]()
    var pages : Pages?
    var fetchedData : PostModel?
    private var startUrl: String = "https://rickandmortyapi.com/api/character"

//MARK: - NavigationController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - set navigation items
        view.backgroundColor = .white
        navigationItem.title = "Rick and Morty"
        
        //MARK: - set NavigationBar buttons
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next page", style: .plain, target: self, action: #selector(nextPageTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(prevPageTapped))
        
        //MARK: - register Cells
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = 350
        
        //MARK: - Fetch All Data
        self.fetchAllData(from: startUrl)
    }
    
    //MARK: - Butons's actions
    @objc func nextPageTapped() {
        guard let nextPage = pages!.next else {
            navigationItem.rightBarButtonItem?.title = ""
            return
        }
        navigationItem.leftBarButtonItem?.title = "Prev page"
        fetchAllData(from: nextPage)
    }
    @objc func prevPageTapped() {
        guard let prevPage = pages!.prev else {
            navigationItem.leftBarButtonItem?.title = ""
            return
        }
        navigationItem.rightBarButtonItem?.title = "Next page"
        fetchAllData(from: prevPage)
    }
    
    //MARK: - Go To DetailView
    private func goToDetailView(on indexPath: IndexPath) {
        guard let character = listOfCharacters[indexPath.row] else { return }
        let newVC = DetailVC()
        newVC.character = character
        self.present(newVC, animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension CharactersTableViewController {
    
   //MARK: - table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCharacters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! CharacterCell
        guard let character = listOfCharacters[indexPath.row] else {
            return CharacterCell()
        }
        cell.fillCharacterCell(from: character)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailView(on: indexPath)
    }

}

// MARK: - network service
extension CharactersTableViewController {
    func fetchAllData(from url: String) {
        let anonymousFunction = { (fetchedData: PostModel?) in
            DispatchQueue.main.async {
                self.listOfCharacters = fetchedData!.results!
                self.pages = fetchedData!.info
                self.tableView.reloadData()
            }
        }
        Network.shared.fetchPostModel(url: url, onCompletion: anonymousFunction)
    }
}