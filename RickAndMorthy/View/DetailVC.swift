//
//  DetailVC.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 29.04.2022.
//

import UIKit

final class DetailVC: UIViewController {
    //MARK: - members of DetailVC
    var character : Result?
    
    //MARK: - scrollView variables
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
    
    private let avatarImageView : CustomImageView = {
        let IV = CustomImageView()
        IV.translatesAutoresizingMaskIntoConstraints = false
        IV.widthAnchor.constraint(equalToConstant: 400).isActive = true
        IV.heightAnchor.constraint(equalTo: IV.widthAnchor,constant: 20).isActive = true
        return IV
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        setupScrollView()
        setLabel()
        setupData()
    }
    
    private func setupData() {
        if let character = character, let url = URL(string: character.image) {
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
    
    private func setLabel() {
        guard let character = character else {
            descriptionLabel.text = "out of data"
            return
        }
        descriptionLabel.text = """
name: \(String(character.name))
species: \(String(character.species))
gender: \(String(character.gender))
status: \(String(character.status))
location: -
amount of episodes: -
"""
    }
    
    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(avatarImageView)
        scrollStackViewContainer.addArrangedSubview(descriptionLabel)
    }
}
