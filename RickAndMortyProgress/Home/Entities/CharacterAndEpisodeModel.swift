//
//  CharacterAndEpisodeModel.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 10/07/25.
//

import Foundation

struct CharacterAndEpisodeModel: Codable {
    let character: CharacterModel
    let episodes: [EpisodesModel]
}
