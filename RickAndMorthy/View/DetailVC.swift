//
//  DetailVC.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 29.04.2022.
//

import UIKit

/*
final class DetailVC: UINavigationController {
    //MARK: - variables
    var character : Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .fullScreen
        view.backgroundColor = .white
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -20).isActive = true
        
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
    
    func setLabelConstr() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
*/

final class DetailVC: UIViewController {
    var character : Result?
    
    var safeArea : UILayoutGuide!
    let avatarImageView = CustomImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.modalPresentationStyle = .fullScreen
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        setupImage()
        setupData()
    }
    
    private func setupImage() {
        view.addSubview(avatarImageView)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFit
        
        avatarImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.9).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
    }
    
    private func setupData() {
        if let character = character, let url = URL(string: character.image!) {
            avatarImageView.loadImage(from: url)
        }
    }
}
