//
//  Character.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 27.04.2022.
//

import Foundation

struct Character : Codable {
    let name: String
    let species: String?
    let gender: String?
    let image: URL?//"https://rickandmortyapi.com/api/character/avatar/2.jpeg",
}

struct ListOfCharacters : Codable {
    let characters: [Character]
}
