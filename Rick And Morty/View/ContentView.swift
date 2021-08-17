//
//  ContentView.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedPage = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedPage,
                    content:  {
                CharactersView().tabItem { Text("Characters")
                    Image("rm")
        
                }.tag(0)
                LocationsView().tabItem { Text("Locations")
                    Image("earth")
                }.tag(1)
                })
                .navigationTitle(navigationTitle)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color(.label))
    }
    
    private var navigationTitle : String {
        switch selectedPage {
        case 0:
            return "Characters"
        case 1:
            return "Locations"
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
