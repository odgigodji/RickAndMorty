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
    let avatarImageView = UIImageView(image: UIImage(named: "loading"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //image
//        avatar.frame = contentView.bounds
        
        
        
        //-------
        
        // Set any attributes of your UI components here.
        
        
        // Add the UI components
        contentView.addSubview(nameLabel)
        contentView.addSubview(avatarImageView)
        
        self.setNameLabel()
//        avatarImageView.frame(forAlignmentRect: CGRect(origin: .init(x: 0, y: 0), size: CGSize(width: 50, height: 50)))
        self.setAvatarImageView()
//        avatarImageView.makeRounded()
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
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setAvatarImageView() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            avatarImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
//            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
//            avatarImageView.heightAnchor.constraint(equalToConstant: 50)
            
            avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            
            avatarImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0 / 2.0),
            avatarImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0 / 2.0)
//
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

