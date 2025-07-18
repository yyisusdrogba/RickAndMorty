//
//  CharacterDetailUseCase.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import Foundation
import Combine
import Resolver

class CharacterDetailUseCase: CharacterDetailUseCaseProtocol {
    @Injected var repository: RickAndMortyCharacterRepositoryProtocol
    
//    init(repository: RickAndMortyCharacterRepositoryProtocol) {
//        self.repository = repository
//    }
    
    func execute(id: Int) -> AnyPublisher <CharacterAndEpisodeModel,Error> {
        repository.getCharacter(id: id)
            .eraseToAnyPublisher()
    }
    
    func saveFavoriteCharacter(character: CharacterModel ) {
        repository.saveCharacter(character: character)
    }
}
