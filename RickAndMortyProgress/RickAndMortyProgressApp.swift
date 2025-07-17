//
//  RickAndMortyProgressApp.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import SwiftUI

@main
struct RickAndMortyProgressApp: App {
    var body: some Scene {
        WindowGroup {
//            let coreData = FavoriteCoreDataManager()
//            let apidataManager = RickAndMortyCharactersAPIDataManager(coreDataManager: coreData)
//            let repository = RickAndMortyCharacterRepository(apiDataManager: apidataManager)
//            let useCase = RickAndMortyCharacterUseCase(repository: repository)
//            let viewModel = RickAndMortyHomeViewModel(rickAndMortyUseCase: useCase)
//            let home = Home(viewModel: viewModel)
            RickAndMortyHub()
        }
    }
}

 

