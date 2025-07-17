//
//  CharacterDetailUseCaseProtocol.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 16/07/25.
//

import Foundation
import Combine

protocol CharacterDetailUseCaseProtocol{
    func execute(id: Int) -> AnyPublisher <CharacterAndEpisodeModel,Error>
    func saveFavoriteCharacter(character: CharacterModel )
}
