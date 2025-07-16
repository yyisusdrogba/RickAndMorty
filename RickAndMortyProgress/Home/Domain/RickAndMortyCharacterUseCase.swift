//
//  RickAndMortyCharacterUseCase.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import Foundation
import Combine

class RickAndMortyCharacterUseCase {
    
    var repository: RickAndMortyCharacterRepository = RickAndMortyCharacterRepository()
    
    //Prueba de execute para filtros
    func execute(species: String, name: String, status: String, currentPage: String) -> AnyPublisher<[RickAndMortyCharacter],Error> {
        repository.getCharacterWithFilter(species: species, name: name, status: status, currentPage: currentPage)
            .eraseToAnyPublisher()
    }
    
}
