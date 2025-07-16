//
//  FavoriteDataManager.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 14/07/25.
//

import Foundation
import Combine

class FavoriteDataManager {
    
    
    func requestAllFavoriteCharacters() -> AnyPublisher<[RickAndMortyCharacter],Error> {
        let coreData = FavoriteCoreDataManager()
        return coreData.fetchCharacters()
            .tryMap{ character in
                character.map { char in
                    RickAndMortyCharacter(id: 1, name: char.name ?? "", species: char.specie ?? "", status: char.status ?? "", image: char.image ?? "")
                }
            }
            .eraseToAnyPublisher()
    }
    
    func requestToDeleteCharacter(character: CharacterEntity) {
        let coreData = FavoriteCoreDataManager()
        coreData.deleteCharacter(character: character)
    }
    
}
