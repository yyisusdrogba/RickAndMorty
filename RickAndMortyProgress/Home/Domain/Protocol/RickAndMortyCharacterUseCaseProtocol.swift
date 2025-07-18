//
//  RickAndMortyCharacterUseCaseProtocol.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 16/07/25.
//

import Foundation
import Combine

protocol RickAndMortyCharacterUseCaseProtocol {
    func execute(species: String, name: String, status: String, currentPage: String) -> AnyPublisher<[RickAndMortyCharacter],Error>
}
