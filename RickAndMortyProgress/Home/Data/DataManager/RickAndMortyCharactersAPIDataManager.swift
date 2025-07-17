//
//  RickAndMortyCharactersAPIDataManager.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import Foundation
import Combine

class RickAndMortyCharactersAPIDataManager: RickAndMortyCharactersAPIDataManagerProtocol {
    
    var coreDataManager: FavoriteCoreDataManagerProtocol
    
    init(coreDataManager: FavoriteCoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    //MARK: Request API'S
    func requestAllCharacters (currentPage: String) -> AnyPublisher<[RickAndMortyCharacter],Error> {
        let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(currentPage)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httResponse = response as? HTTPURLResponse, httResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: RickAndMortyCharactersRequestDTO.self, decoder: JSONDecoder())
            .map(\.results)
            .eraseToAnyPublisher()
    }
    
    func requestCharacter(id: Int) -> AnyPublisher <CharacterModel,Error> {
        let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httresponse = response as? HTTPURLResponse, httresponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: CharacterModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func requestEpisodesOfCharacter(episode:String) -> AnyPublisher<EpisodesModel,Error> {
        let url = URL(string: "\(episode)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httresponse = response as? HTTPURLResponse, httresponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: EpisodesModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchCharacterAndEpisodes (characterID:Int) -> AnyPublisher<CharacterAndEpisodeModel,Error> {
        requestCharacter(id: characterID)
            .flatMap { character -> AnyPublisher<CharacterAndEpisodeModel, Error > in
                let episodePublisher = character.episode.map { self.requestEpisodesOfCharacter(episode: $0)
                }
                return Publishers.MergeMany(episodePublisher)
                    .collect()
                    .map { episodes in
                        CharacterAndEpisodeModel(character: character, episodes: episodes)
                    }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func fetchCharactersWithFilter(species: String, name: String, status: String, currentPage: String) -> AnyPublisher<[RickAndMortyCharacter],Error> {
        let url = obtainUrlWithFilter(species: species, name: name, status: status, currentPage: currentPage)
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httResponse = response as? HTTPURLResponse, httResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: RickAndMortyCharactersRequestDTO.self, decoder: JSONDecoder())
            .map(\.results)
            .eraseToAnyPublisher()
    }
    
    //MARK: Core Data
    func saveCharactersToCoreData(character: CharacterModel) {
        coreDataManager.saveCharacter(character: character)
    }
}

