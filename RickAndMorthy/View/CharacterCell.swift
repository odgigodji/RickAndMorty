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
//    let gender = UILabel()
    let avatarImageView = CustomImageView()
    let infoLabel = UILabel()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(infoLabel)
        
        self.setAvatarImageView()
        self.setNameLabel()
        self.setInfoLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - configure for cell's members
extension CharacterCell {
    
    private func setNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 25)
        
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
    
    private func setInfoLabel() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont.systemFont(ofSize: 20)
        infoLabel.numberOfLines = 0
        infoLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20)
        ])
    }
}

extension CharacterCell {
    func fillCharacterCell(from character: Result) {
        self.nameLabel.text = character.name
        
        //MARK: - image from URL
        guard let url = URL(string: character.image!) else { return }
        self.avatarImageView.loadImage(from: url)
        
        //MARK: - set info label text
        setInfoLabelText(from: character)
    }
    
    private func setInfoLabelText(from character: Result) {
        self.infoLabel.text = """
\(String(character.species!))

\(String(character.gender!))
"""
    }
}

