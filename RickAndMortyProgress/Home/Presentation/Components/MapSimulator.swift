//
//  MapSimulator.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import Foundation
import SwiftUI
import MapKit

struct MapSimulator: View {
    
    var character: String
    @StateObject private var viewModel = CharacterDetailViewModel()
    
    var body: some View {
        Map(position: $viewModel.position){
            Marker("\(character)", coordinate: viewModel.coordinate)
        }
        .navigationTitle("Character Detail")
        .mapStyle(.standard)
        .ignoresSafeArea()
    }
}
