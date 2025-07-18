//
//  RickAndMortyCharacterRepository.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import Foundation
import Combine
import Resolver

class RickAndMortyCharacterRepository: RickAndMortyCharacterRepositoryProtocol {
    
    @Injected var apiDataManager: RickAndMortyCharactersAPIDataManagerProtocol
    
//    init(apiDataManager: RickAndMortyCharactersAPIDataManagerProtocol) {
//        self.apiDataManager = apiDataManager
//    }
    
    func getCharacters(currentPage: String) -> AnyPublisher<[RickAndMortyCharacter], Error> {
        apiDataManager.requestAllCharacters(currentPage: currentPage)
            .eraseToAnyPublisher()
    }
    
    func getCharacter(id: Int) -> AnyPublisher<CharacterAndEpisodeModel,Error> {
        apiDataManager.fetchCharacterAndEpisodes(characterID: id)
            .eraseToAnyPublisher()
    }
    
    func getCharacterWithFilter(species: String, name: String, status: String, currentPage: String)  -> AnyPublisher<[RickAndMortyCharacter], Error>{
        let emptyStatus = status == "All" ? "" : status
        let emptySpecies = species == "All" ? "" : species
        let emptyName = name == "" ? "" : name
        if emptyStatus.isEmpty && emptySpecies.isEmpty && emptyName.isEmpty {
            return apiDataManager.requestAllCharacters(currentPage: currentPage)
        } else {
            return apiDataManager.fetchCharactersWithFilter(species: species, name: name, status: status, currentPage: currentPage)
        }
    }
    
    func saveCharacter(character: CharacterModel) {
        apiDataManager.saveCharactersToCoreData(character: character)
    }
    
}
