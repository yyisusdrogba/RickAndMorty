//
//  CharacterDetailCard.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 09/07/25.
//

import Foundation
import SwiftUI

struct CharacterDetailCard: View {
    
    var character: CharacterModel
    var body: some View{
        VStack (spacing: 10 ){
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 140, height: 140)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.buttonBorder)
                case .failure:
                    Image("FailToLoadImage")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 140)
                default:
                    EmptyView()
                }
            }
            Text("Name: \(character.name)")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
                
            VStack (alignment: .listRowSeparatorLeading) {
                HStack ( spacing: 10) {
                    Text("Gender: \(character.gender)")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                    Text("Species: \(character.species)")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                }
                HStack ( spacing: 10) {
                    Text("Status: \(character.status)")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                    Text("Location: \(character.location.name)")
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                }
            }
        }
    }
}
