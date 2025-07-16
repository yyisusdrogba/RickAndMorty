//
//  CharacterDetailUseCase.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import Foundation
import Combine

class CharacterDetailUseCase {
    let repository: RickAndMortyCharacterRepository = RickAndMortyCharacterRepository()
    
    func execute(id: Int) -> AnyPublisher <CharacterAndEpisodeModel,Error> {
        repository.getCharacter(id: id)
            .eraseToAnyPublisher()
    }
    
    func saveFavoriteCharacter(character: CharacterModel ) {
        repository.saveCharacter(character: character)
    }
}
