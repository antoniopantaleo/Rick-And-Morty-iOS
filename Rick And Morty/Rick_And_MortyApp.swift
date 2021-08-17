//
//  Rick_And_MortyApp.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

@main
struct Rick_And_MortyApp: App {
    
    init() {
        UIScrollView.appearance().backgroundColor = UIColor(named: "background")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
