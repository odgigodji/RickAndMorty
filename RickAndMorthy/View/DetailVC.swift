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
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: UIViewController())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
