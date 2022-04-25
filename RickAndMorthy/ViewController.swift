//
//  ViewController.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 23.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let listOfChar = ["Rick", "Jerry", "BAtt"]
    
    let tableView = UITableView()
//    let tableView = UITableView.init(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setConstraints()
        
        tableView.dataSource = self
                
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
    }
}


extension ViewController {
    func setNavigationItems() {
        view.backgroundColor = .white
        navigationItem.title = "Список персонажей из Рика и Морти"
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "Image"), for: .default)
//        navigationController?.hidesBarsOnTap = true
//        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.navigationBar.backgroundColor = .systemGray5
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController {
    func setConstraints() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false //disable costr
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
