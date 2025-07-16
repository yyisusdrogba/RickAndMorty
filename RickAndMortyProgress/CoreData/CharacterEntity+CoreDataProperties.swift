//
//  CharacterEntity+CoreDataProperties.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 15/07/25.
//
//

import Foundation
import CoreData


extension CharacterEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterEntity> {
        return NSFetchRequest<CharacterEntity>(entityName: "CharacterEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var specie: String?
    @NSManaged public var status: String?
    @NSManaged public var image: String?
    @NSManaged public var id: UUID

}

extension CharacterEntity : Identifiable {

}
