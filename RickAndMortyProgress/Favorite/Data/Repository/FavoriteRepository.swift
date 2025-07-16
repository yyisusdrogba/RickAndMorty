//
//  FavoriteRepository.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 14/07/25.
//

import Foundation
import Combine

class FavoriteRepository {
    
    let apiDataManager = FavoriteDataManager()
    

    
    func getAllFavoriteCharacters() -> AnyPublisher<[RickAndMortyCharacter],Error> {
        return apiDataManager.requestAllFavoriteCharacters()
            .eraseToAnyPublisher()
    }
    
    
}
