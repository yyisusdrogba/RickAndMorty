//
//  RickAndMortyConstants.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 10/07/25.
//

import Foundation

func speciesToHome () -> [SpeciesModel] {
    return [
        SpeciesModel(title: "All"),
        SpeciesModel(title: "Human"),
        SpeciesModel(title: "Alien"),
        SpeciesModel(title: "Humanoid"),
        SpeciesModel(title: "Unknow"),
        SpeciesModel(title: "Poopybutthole"),
        SpeciesModel(title: "Mythological"),
        SpeciesModel(title: "creature"),
        SpeciesModel(title: "Animal"),
        SpeciesModel(title: "Cronenberg"),
        SpeciesModel(title: "Disease"),
        SpeciesModel(title: "Robot"),
    ]
}

func obtainUrlWithFilter(species: String, name: String, status: String, currentPage: String) -> URL{
    
    var url = URL(string: "")
    if species == "" {
        url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&species=&status=\(status)")
    } else if name == "" {
        url = URL(string: "https://rickandmortyapi.com/api/character/?name=&species=\(species)&status=\(status)")
    }
    else if status == "" {
        url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&species=\(species)&status=")
    }
    
    return url ?? URL(string: "https://rickandmortyapi.com/api/character")!
}

func statusToHome () -> [StatusModel] {
    return [
        StatusModel(title: "All"),
        StatusModel(title: "Alive"),
        StatusModel(title: "Dead"),
        StatusModel(title:  "Unknown")
    ]
}

struct StatusModel {
    let id = UUID()
    let title: String
}

struct SpeciesModel {
    let id = UUID()
    let title: String
}

enum SpeciesEnum: String {
    case all
    case human
    case alien
    case humanoid
    case unknow
    case poopybutthole
    case mythological
    case creature
    case animal
    case cronenberg
}
