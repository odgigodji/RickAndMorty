//
//  DetailVC.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 29.04.2022.
//

import UIKit

final class DetailVC: UINavigationController {
    //MARK: - variables
    var character : Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .fullScreen
        view.backgroundColor = .white
        setNavigataionController()
//        sleep(2)
//        self.dismiss(animated: true, completion: nil)
        print("viedDidLoad")
    }
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    init(about character: Result, rootViewController: UIViewController) {
        super.init(rootViewController: UIViewController())
        self.character = character
        
        print(self.character!.name!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setNavigataionController() {
        self.navigationItem.title = "TTTER"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(tapped))
    }
    
    @objc  func tapped() {
        print("back")
    }
}
