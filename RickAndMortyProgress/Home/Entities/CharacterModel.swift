//
//  CharacterModel.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import Foundation

struct CharacterModel: Codable {
    let name: String
    let image: String
    let gender: String
    let species: String
    let status: String
    let episode: [String]
    let location: LocationCharacter
}

struct LocationCharacter: Codable {
    let name: String
}

struct EpisodesModel:Codable {
    
    let id: Int
    let name: String
    let episode: String
    let air_date: String
    
}



