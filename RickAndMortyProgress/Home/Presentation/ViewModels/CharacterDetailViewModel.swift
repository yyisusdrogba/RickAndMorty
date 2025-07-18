//
//  CharacterDetailViewModel.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import Foundation
import Combine
import _MapKit_SwiftUI

class CharacterDetailViewModel: ObservableObject {
    
    var useCase: CharacterDetailUseCaseProtocol
    @Published var characterDetail =  CharacterAndEpisodeModel(character: CharacterModel(name: "", image: "", gender: "", species: "", status: "", episode: [""], location: LocationCharacter(name: "")), episodes: [EpisodesModel(id: 0, name: "", episode: "", air_date: "")])
    private var cancellable = Set<AnyCancellable>()
    @Published var position: MapCameraPosition
    var character: RickAndMortyCharacter?
    var coordinate: CLLocationCoordinate2D
    var timer: Timer?
    
    init(useCase: CharacterDetailUseCaseProtocol) {
        self.useCase = useCase
        coordinate = CLLocationCoordinate2D(latitude: Double.random(in: 19.4326...19.6000), longitude: -99.1332)
        position = .camera(MapCamera(centerCoordinate: coordinate, distance: 500, heading: 0, pitch: 0))
        
        timer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
            self.moveLocation()
        }
    }
    
    func getDetailCharacter(id: Int) {
        useCase.execute(id: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Se cargo correctamente el detalle del personaje")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { character in
                self.characterDetail = character
            }
            .store(in: &cancellable)

    }
    
    func moveLocation() {
        let latOffSet = Double.random(in: -0.0005...0.0005)
        let lonOffSet = Double.random(in: -0.0005...0.0005)
        
        coordinate.latitude += latOffSet
        coordinate.longitude += lonOffSet

        position = .camera(MapCamera(centerCoordinate: coordinate, distance: 500, heading: 0, pitch: 0))
        
    }
    
    func saveFavorite() {
        let character = characterDetail.character
        useCase.saveFavoriteCharacter(character: character)
    }
}
