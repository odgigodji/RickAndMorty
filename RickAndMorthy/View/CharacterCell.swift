//
//  CharacterCell.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 28.04.2022.
//

import UIKit

final class CharacterCell: UITableViewCell {

//MARK: - list of variables
    let nameLabel = UILabel()
    let species = UILabel()
    let gender = UILabel()
    let avatarImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //image
//        avatar.frame = contentView.bounds
        
        
        
        //-------
        
        // Set any attributes of your UI components here.
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        
        // Add the UI components
        contentView.addSubview(nameLabel)
        contentView.addSubview(avatarImageView)
        
        self.setNameLabel()
        self.setAvatarImageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - set constraints
extension CharacterCell {
    
    private func setNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setAvatarImageView() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension CharacterCell {
    func fillCharacterCell(from character: Result) {
        self.nameLabel.text = character.name
        self.gender.text = character.gender
    }
}