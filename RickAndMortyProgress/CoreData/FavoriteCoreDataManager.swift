//
//  FavoriteCoreDataManager.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 14/07/25.
//

import Foundation
import CoreData
import Combine


class FavoriteCoreDataManager: ObservableObject {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CharacterContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error to loaded core data \(error)")
            } else {
                print("Successfully loaded core data")
            }
        }
    }
    
    func saveData() {
        do{
            try container.viewContext.save()
        } catch{
            print("Error saving")
        }
    }
    
    func fetchCharacters() -> Future<[CharacterEntity], Error>{
        return Future { promise in
            do{
                promise(.success(try self.container.viewContext.fetch(CharacterEntity.fetchRequest())))
            } catch {
                promise(.failure(error))
            }
        }
    }
    
    func saveCharacter(character: CharacterModel) {
        let newCharacter = CharacterEntity(context: container.viewContext)
        newCharacter.id = UUID()
        newCharacter.name = character.name
        newCharacter.specie = character.species
        newCharacter.status = character.status
        newCharacter.image = character.image

        do {
            saveData()
        } catch {
            print("Error save Character")
        }
        
    }
    
    
    func deleteCharacter(character: CharacterEntity) {
            container.viewContext.delete(character)
            saveData()
            fetchCharacters()
    }
    
}
