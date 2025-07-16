//
//  CharacterDetail.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import SwiftUI

struct CharacterDetail: View {
    
    @StateObject var viewModel = CharacterDetailViewModel()
    @State private var favoriteStatus: Bool = false

    var id: Int
    
    var body: some View {
        
        ZStack {
            Color(hex: "#97CE4C")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    VStack {
                        Button {
                            favoriteStatus.toggle()
                            viewModel.saveFavorite()
                        } label: {
                            Text("Favorite:")
                                .foregroundStyle(.black)
                            Image(systemName: favoriteStatus ? "star.fill" : "star")
                                .renderingMode(.original)
                        }
                        CharacterDetailCard(character: viewModel.characterDetail.character)
                    }
    //                .clipShape(.rect(cornerRadius: 20))
                    VStack {
                        MapSimulator(character: viewModel.characterDetail.character.name)
                            .clipShape(.rect(cornerRadius: 10))
                            .frame(height: 300)
                    }
                    
                    VStack {
                        ScrollView (.horizontal) {
                            LazyHGrid(rows: [GridItem(.fixed(100))], spacing: 50) {
                                ForEach(viewModel.characterDetail.episodes, id: \.id) { episode in
                                    VStack {
                                        Image("Episode")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 140, height: 140)
                                        Text(episode.name)
                                        Text(episode.episode)
                                        Text(episode.air_date)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .onAppear{
                    viewModel.getDetailCharacter(id: id)
                }
            }
       
        }
        
    }
}

#Preview {
    CharacterDetail(id: 1)
}
