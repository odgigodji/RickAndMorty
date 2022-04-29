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
    let avatarImageView = CustomImageView()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(avatarImageView)
        
        self.setAvatarImageView()
        self.setNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - configure for cell's members
extension CharacterCell {
    
    private func setNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: -20)
        ])
    }
    
    private func setAvatarImageView() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -30),
            avatarImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0 / 2.0),
            avatarImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0 / 2.0)
        ])
    }
}

extension CharacterCell {
    func fillCharacterCell(from character: Result) {
        self.nameLabel.text = character.name
        self.gender.text = character.gender
        
        //MARK: - image from URL
        guard let url = URL(string: character.image!) else { return }
        self.avatarImageView.loadImage(from: url)
        
//        self.nameLabel.text = character.episodes?[0] ?? "her"
    }
}

