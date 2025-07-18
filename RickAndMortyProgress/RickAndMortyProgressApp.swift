//
//  RickAndMortyProgressApp.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 07/07/25.
//

import SwiftUI
import Resolver

@main
struct RickAndMortyProgressApp: App {
    
    init(){
        Resolver.registerAllServices()
    }
    
    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}

 

