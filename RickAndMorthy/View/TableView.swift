//
//  TableView.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 27.04.2022.
//

import Foundation
import UIKit

extension ViewController : UITableViewDataSource {
    
    func setTableView(on tableView: UITableView) {
        view.addSubview(tableView)
        
        setConstraints(on: tableView)
        registerCell(on: tableView)
    }
    
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
