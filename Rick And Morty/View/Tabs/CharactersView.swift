//
//  CharactersView.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct CharactersView: View {
    
    @ObservedObject private var viewModel = CharactersViewModel.shared
    
    private var columns : [GridItem] = [
        .init(.flexible(), spacing: 0),
        .init(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(viewModel.items) {character in
                    CharacterCell(character: character)
                        .onAppear {
                            viewModel.shouldLoad(character)
                        }
                }
            })
        }.onAppear {
            viewModel.fetchMany()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
