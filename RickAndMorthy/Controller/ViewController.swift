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
    
    let listOfChar = ["Rick", "Jerry", "BAtt", "a4", "a5", "a6", "a7", "a8", "a9", "a10"]
    
//    let tableView = UITableView()
    let tableView = UITableView()
    
//    lazy var tableView: UITableView = {
//            let tableView = UITableView()
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//            tableView.translatesAutoresizingMaskIntoConstraints =  false
//            return tableView
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setTableView()
    }
}


extension ViewController {
    func setTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false //disable costr
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfChar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id")
        let name = listOfChar[indexPath.row]
        
        cell?.textLabel?.text = name
        
        return cell ?? UITableViewCell()
    }
}
