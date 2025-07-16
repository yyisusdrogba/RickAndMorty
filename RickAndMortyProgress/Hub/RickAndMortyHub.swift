//
//  RickAndMortyHub.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 08/07/25.
//

import SwiftUI

struct RickAndMortyHub: View {
    
    let coreDataManager: FavoriteCoreDataManager
    
    init() {
        coreDataManager = FavoriteCoreDataManager()
    }
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                Home()
            }
            Tab("Favorite", systemImage: "star.fill") {
                FavoriteView()
            }
        }
        .background(Color.black)
        .tint(Color(hex: "#97CE4C"))
    }
}

#Preview {
    RickAndMortyHub()
}
