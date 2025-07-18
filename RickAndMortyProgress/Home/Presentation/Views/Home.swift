//
//  Home.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import SwiftUI
import Resolver

struct Home: View {
    @State private var characterSearch: String = ""
    @ObservedObject var viewModel: RickAndMortyHomeViewModel = Resolver.resolve()
    @FocusState private var characterIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack{
                Color
                    .black
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("Rick-and-Morty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 90)
                        HStack {
                            TextField("Search a character", text: $characterSearch)
                                .background(Color(hex: "#F5F5F5"))
                                .clipShape(.buttonBorder)
                                .padding(0)
                                .onSubmit {
                                    viewModel.getAllCharacters(currentPage: String(viewModel.currentPage), characterSearch: characterSearch)
                                    characterSearch = ""
                                }
                                .focused($characterIsFocused)
                                .padding(EdgeInsets(top: 2, leading: 4, bottom: 4, trailing: 0))
                            Button("", systemImage: "magnifyingglass") {
                                viewModel.getAllCharacters(currentPage: String(viewModel.currentPage), characterSearch: characterSearch)
                                characterSearch = ""
                                characterIsFocused = false
                            }
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        }

                        HStack (spacing: 60) {
                            Menu {
                                ForEach(statusToHome(),id: \.id) { status in
                                    Button( status.title) {
                                        viewModel.status = status.title
                                        viewModel.getAllCharacters(currentPage: String(viewModel.currentPage))
                                    }
                                }
                            } label: {
                                Image("Status")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                Text("Status")

                            }
                            
                            Menu {
                                ForEach(speciesToHome(),id: \.id) { species in
                                    Button( species.title) {
                                        viewModel.species = species.title
                                        viewModel.getAllCharacters(currentPage: String(viewModel.currentPage))
                                    }
                                }
                            } label: {
                                Image("Species")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                Text("Species")
                            }
                        }
                    }
                        ScrollView (.vertical, showsIndicators: false){
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200)), GridItem(.adaptive(minimum: 200))], spacing: 0) {
                                ForEach(viewModel.charactersArray, id: \.id) { character in
                                    NavigationLink {
                                        CharacterDetail(id: character.id)
                                    } label: {
                                        VStack {
                                            CardCharacter(name: character.name, especie: character.species, estado: character.status, image: character.image)
                                        }
                                        .padding(EdgeInsets(top: 5, leading: 4, bottom: 5, trailing: 4))
                                    }
                                }
                            }
                        }
                    PaginationView(currentPage: $viewModel.currentPage)
                }
                .onAppear {
                    viewModel.getAllCharacters(currentPage: String(viewModel.currentPage))
                }
            }

        }
    }
}

#Preview {
    Home()
}
