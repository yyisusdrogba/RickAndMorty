//
//  FavoriteUseCase.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 14/07/25.
//

import Foundation
import Combine

class FavoriteUseCase {
    
    let repository = FavoriteRepository()
    
    func execute() -> AnyPublisher <[RickAndMortyCharacter],Error> {
        return repository.getAllFavoriteCharacters()
            .eraseToAnyPublisher()
    }
    
}
