//
//  CardCharacter.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 08/07/25.
//

import Foundation
import SwiftUI

struct CardCharacter: View {
    
    var name: String
    var especie: String
    var estado: String
    var image: String
    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .clipShape(.rect(cornerRadius: 20))
                .foregroundStyle(Color(hex: "#2C3E50"))
            VStack (spacing: 10){
                AsyncImage(url: URL(string: image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 140, height: 140)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.circle)
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
                .padding()
                Text("Name: \(name)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                Text("Specie: \(especie)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                Text("Status: \(estado)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
            }
            .padding(.bottom , 10)
        }
    }
}
