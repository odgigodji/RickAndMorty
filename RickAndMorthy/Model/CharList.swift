//
//  CharList.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 27.04.2022.
//

import Foundation

// MARK: - PostModel
struct PostModel: Codable {
    let info: Pages
    var results: [Result]
}

// MARK: - Info
struct Pages: Codable {
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let image: String?
    
//    let location: Location?
//    let episodes: [String]?

}

// MARK: - Location
struct Location: Codable {
    let name: String?
}



