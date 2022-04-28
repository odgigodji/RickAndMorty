//
//  CharacterCell.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 28.04.2022.
//

import UIKit

final class CharacterCell: UITableViewCell {

    let courseName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Set any attributes of your UI components here.
        courseName.translatesAutoresizingMaskIntoConstraints = false
        courseName.font = UIFont.systemFont(ofSize: 20)
        
        // Add the UI components
        contentView.addSubview(courseName)
        
        NSLayoutConstraint.activate([
            courseName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            courseName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            courseName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            courseName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
