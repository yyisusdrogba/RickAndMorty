//
//  FavoriteView.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 08/07/25.
//

import SwiftUI
import LocalAuthentication

struct FavoriteView: View {
    @StateObject var viewModel = FavoriteViewModel()
    @State private var viewBlur = true
    let context = LAContext()
    
    var body: some View {
        ZStack{
            Color
                .black
                .ignoresSafeArea()
            ScrollView{
                ForEach(viewModel.favorites, id: \.name) { character in
                    VStack{
                        CardCharacter(name: character.name, especie: character.species, estado: character.status, image: character.image)
                    }
                    .onTapGesture {
                        print("tap")
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.loadFavorites()
            authenticate()
        }
        .blur(radius: viewBlur ? 4 : 0)
    }
    
    func authenticate(){
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Para ver tus personajes favoritos por favor autenticate") { success, error in
                if success {
                    viewBlur = false
                } else {
                    print("Error en la autenticacion biometrica")
                }
            }
        } else {
            print("No soporta face ID")
        }
    }
}

#Preview {
    FavoriteView()
}
