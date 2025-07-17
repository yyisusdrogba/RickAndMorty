//
//  RickAndMortyCharactersAPIDataManagerProtocol.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 15/07/25.
//

import Foundation
import Combine

protocol RickAndMortyCharactersAPIDataManagerProtocol {
    func fetchCharactersWithFilter(species: String, name: String, status: String, currentPage: String) -> AnyPublisher<[RickAndMortyCharacter],Error>
    func fetchCharacterAndEpisodes (characterID:Int) -> AnyPublisher<CharacterAndEpisodeModel,Error>
    func requestEpisodesOfCharacter(episode:String) -> AnyPublisher<EpisodesModel,Error>
    func requestCharacter(id: Int) -> AnyPublisher <CharacterModel,Error>
    func requestAllCharacters (currentPage: String) -> AnyPublisher<[RickAndMortyCharacter],Error>
    
    //MARK: Core Data
    func saveCharactersToCoreData(character: CharacterModel)
}
