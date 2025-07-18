//
//  Resolver.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 17/07/25.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        //MARK: HOME AND CHARACTERDETAIL DEPENDENCY INYECTION
        //MARK: CoreData
        register { FavoriteCoreDataManager() as FavoriteCoreDataManagerProtocol }
        //MARK: Data
        register { RickAndMortyCharactersAPIDataManager() as RickAndMortyCharactersAPIDataManagerProtocol}
        register { RickAndMortyCharacterRepository() as RickAndMortyCharacterRepositoryProtocol}
        //MARK: Domain
        register { RickAndMortyCharacterUseCase() as RickAndMortyCharacterUseCaseProtocol }
        register { CharacterDetailUseCase() as CharacterDetailUseCaseProtocol}
        //MARK: ViewModel
        register {
            RickAndMortyHomeViewModel(rickAndMortyUseCase: resolve())
        }
        
        
        
        //MARK: FAVORITE CHARACTER
        //MARK: CoreData
        
        //MARK: Data
        
        //MARK: Domain
        
        //MARK: ViewModel

    }
}
