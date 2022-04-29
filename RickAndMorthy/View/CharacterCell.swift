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

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

extension CharacterCell {
    func fillCharacterCell(from character: Result) {
        self.nameLabel.text = character.name
        self.gender.text = character.gender
        
        self.avatarImageView.image = UIImage(named: "loading")
        //MARK: - image from URL
        if let url = URL(string: character.image!) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async {
                    self.avatarImageView.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}

