//
//  DetailVC.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 29.04.2022.
//

import UIKit

final class DetailVC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Rick and Morty"
    }
    init(about character: Result, rootViewController: UIViewController) {
        super.init(rootViewController: UIViewController())
        print(character.name)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
