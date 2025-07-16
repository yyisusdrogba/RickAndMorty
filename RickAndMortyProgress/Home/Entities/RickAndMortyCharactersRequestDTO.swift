//
//  RickAndMortyCharactersRequestDTO.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import Foundation

struct RickAndMortyCharactersRequestDTO: Codable {
    let results: [RickAndMortyCharacter]
}

struct RickAndMortyCharactersCombined {
    let character: [RickAndMortyCharacter]
}

struct RickAndMortyCharacter: Codable, Hashable {
    let id: Int
    let name: String
    let species: String
    let status: String
    let image: String
}

struct Info: Codable {
    let pages: Int
}
