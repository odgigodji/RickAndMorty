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
//    let listOfChar = ["Rick", "Jerry", "BAtt", "a4", "a5", "a6", "a7", "a8", "a9", "a10", "Rick", "Jerry", "BAtt", "a4", "a5", "a6", "a7", "a8", "a9", "a10"]
    
    var listOfChar : [Result] = []
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setTableView(on: tableView)
        
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI() {
        let anonymousFunction = { (fetchedCharacterList: [Result]?) in
            DispatchQueue.main.async {
                self.listOfChar = fetchedCharacterList!
                
                print(fetchedCharacterList)
                
                self.tableView.reloadData()
            }
        }
        Network.shared.fetchNewsList(onCompletion: anonymousFunction)
        tableView.reloadData()
    }
}

