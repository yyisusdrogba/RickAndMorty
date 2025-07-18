//
//  RickAndMortyCharacterRepositoryProtocol.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 16/07/25.
//

import Foundation
import Combine

protocol RickAndMortyCharacterRepositoryProtocol {
    func getCharacters(currentPage: String) -> AnyPublisher<[RickAndMortyCharacter], Error>
    func getCharacter(id: Int) -> AnyPublisher<CharacterAndEpisodeModel,Error>
    func getCharacterWithFilter(species: String, name: String, status: String, currentPage: String)  -> AnyPublisher<[RickAndMortyCharacter], Error>
    func saveCharacter(character: CharacterModel)
}
