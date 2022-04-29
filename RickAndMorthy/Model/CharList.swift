//
//  CharList.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 27.04.2022.
//

import Foundation

// MARK: - PostModel
struct PostModel: Codable {
    let info: Pages?
    var results: [Result]?

    
//    enum CodingKeys: String, CodingKey {
//        case info
//        case results
//    }
}

// MARK: - Info
struct Pages: Codable {
//    let count: Int?
//    let pages: Int?
    let next: String?
    let prev: String?
//    enum CodingKeys: String, CodingKey {
//        case count
//        case pages
//        case next
//    }
}

// MARK: - Result
struct Result: Codable {
//    let id: Int?
    let name: String?
//    let status: String?
    let species: String?
//    let type: String?
    let gender: String?
//    let origin: Location?
    let image: String?
    
    let location: Location?
    let episodes: [String]?
//    let url: String?
//    let created: String?

//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case status
//        case species
//        case type
//        case gender
//        case origin
//        case location
//        case image
//        case episode
//        case url
//        case created
//    }
}

// MARK: - Location
struct Location: Codable {
    let name: String?
//    let url: String?

//    enum CodingKeys: String, CodingKey {
//        case name
//        case url
//    }
}



