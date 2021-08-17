//
//  CharactersView.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        CharactersGrid(characters: viewModel.items) { char in
            viewModel.shouldLoad(char)
        }
            .onAppear {
            viewModel.fetchMany()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
