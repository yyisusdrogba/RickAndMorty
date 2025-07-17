//
//  FavoriteCoreDataManagerProtocol.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 15/07/25.
//

import Foundation
import CoreData
import Combine

protocol FavoriteCoreDataManagerProtocol {
    var container: NSPersistentContainer { get }
    
    func saveData()
    func fetchCharacters() -> Future<[CharacterEntity], Error>
    func saveCharacter(character: CharacterModel)
    func deleteCharacter(character: CharacterEntity)
}
