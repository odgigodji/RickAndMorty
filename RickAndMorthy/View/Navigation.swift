//
//  MainView.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 27.04.2022.
//

import UIKit

extension ViewController {
    
    func setNavigationItems() {
        view.backgroundColor = .white
        navigationItem.title = "Персонажи"
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "Image"), for: .default)
//        navigationController?.hidesBarsOnTap = true
//        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.navigationBar.backgroundColor = .systemGray5
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
