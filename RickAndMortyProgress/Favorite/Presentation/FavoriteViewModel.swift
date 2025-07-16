//
//  FavoriteViewModel.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 14/07/25.
//

import Foundation
import Combine
import SwiftUI

class FavoriteViewModel: ObservableObject {
    
    let useCase =  FavoriteUseCase()
    private var cancellable = Set<AnyCancellable>()
    @Published var favorites: [RickAndMortyCharacter] = []
    
    func loadFavorites() {
        useCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Cargados los favoritos correctamente")
                case .failure(let error):
                    print("Error al cargar los favoritos: \(error)")
                    
                }
            } receiveValue: { characters in
                print(self.favorites)
                print(self.favorites.count)
                self.favorites = characters
            }
            .store(in: &self.cancellable)
    }
}


  
