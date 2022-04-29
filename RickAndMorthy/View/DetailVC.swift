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
    //MARK: - members of DetailVC
    var character : Result?
//    var safeArea : UILayoutGuide!
    let avatarImageView = CustomImageView()
//    let scrollView = UIScrollView()
//    let contentView = UIView()
    
    //MARK: - scrollView constants
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subView1 : CustomImageView = {
        let IV = CustomImageView()
        IV.translatesAutoresizingMaskIntoConstraints = false
        IV.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        IV.widthAnchor.constraint(equalToConstant: 400).isActive = true
        IV.heightAnchor.constraint(equalTo: IV.widthAnchor,constant: 20).isActive = true
        return IV
    }()
    
//    private let subView1: UIView = {
//        let view = UIView()
//        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        view.backgroundColor = UIColor.blue
//        return view
//    }()
    
    private let subview2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)

        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setLabel() {
        guard let character = character else {
            subview2.text = "out of data"
            return
        }
//отображаться имя, раса, пол, статус, аватарка, последнее известное местоположение, кол-во эпизодов, в которых
        subview2.text = """
name: \(String(character.name!))
species: \(String(character.species!))

"""
    }
//    private let subview3: UIView = {
//        let view = UIView()
//        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        view.backgroundColor = UIColor.gray
//    return view
//    }()
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.modalPresentationStyle = .fullScreen
        view.backgroundColor = .systemGray2
//        safeArea = view.layoutMarginsGuide
        
        setupScrollView()
        setupImage()
        setLabel()
        setupData()
    }
    
    private func setupImage() {
        subView1.addSubview(avatarImageView)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFit
//
        avatarImageView.centerXAnchor.constraint(equalTo: subView1.centerXAnchor).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: subView1.topAnchor, constant: 40).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: subView1.widthAnchor, multiplier: 0.9).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
        
//        avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
    }
    
    private func setupData() {
        if let character = character, let url = URL(string: character.image!) {
            avatarImageView.loadImage(from: url)
        }
    }
}

//MARK: - setupScrollView
extension DetailVC {
    private func setupScrollView() {
        let margins = view.layoutMarginsGuide
        view.addSubview(scrollView)
        
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        configureContainerView()
    }
    
    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(subView1)
        scrollStackViewContainer.addArrangedSubview(subview2)
//        scrollStackViewContainer.addArrangedSubview(subview3)
    }
}
