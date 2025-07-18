//
//  MapSimulator.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import Foundation
import SwiftUI
import MapKit
import Resolver
struct MapSimulator: View {
    
    var character: String
    @StateObject private var viewModel: CharacterDetailViewModel
    
    init(character: String) {
        let useCase = Resolver.resolve(CharacterDetailUseCaseProtocol.self)
        _viewModel = StateObject(wrappedValue: CharacterDetailViewModel(useCase: useCase))
        self.character = character
    }
    var body: some View {
        Map(position: $viewModel.position){
            Marker("\(character)", coordinate: viewModel.coordinate)
        }
        .navigationTitle("Character Detail")
        .mapStyle(.standard)
        .ignoresSafeArea()
    }
}
