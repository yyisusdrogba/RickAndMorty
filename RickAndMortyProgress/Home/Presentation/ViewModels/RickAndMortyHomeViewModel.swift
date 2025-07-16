//
//  RickAndMortyHomeViewModel.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import Foundation
import Combine

class RickAndMortyHomeViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var charactersArray = [RickAndMortyCharacter]()
    private var rickAndMortyUseCase = RickAndMortyCharacterUseCase()
    @Published var species = ""
    @Published var status = ""
    @Published var name = ""
    @Published var currentPage = 1 {
        didSet {
            self.getAllCharacters(currentPage: String(currentPage))
        }
    }
    
    func getAllCharacters(currentPage: String, characterSearch: String? = nil) {
        rickAndMortyUseCase.execute(species: species, name: characterSearch ?? "", status: status, currentPage: currentPage)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("All characters obtain")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { characters in
                    self.charactersArray = characters
            }
            .store(in: &self.cancellable)
    }
    
}


