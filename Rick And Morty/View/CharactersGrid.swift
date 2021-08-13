//
//  CharactersGrid.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct CharactersGrid: View {
    
    let characters : [Character]
    let onItemAppeared : ((Character)->())?

    private var columns : [GridItem] = [
        .init(.flexible(),spacing:10),
        .init(.flexible(),spacing:10)
    ]
    
    init(characters : [Character], onItemAppeared: @escaping ((Character)->()) = {_ in}) {
        self.characters = characters
        self.onItemAppeared = onItemAppeared
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(characters) {character in
                    CharacterCell(character: character)
                        .onAppear {
                            onItemAppeared?(character)
                        }
                }
            })
            .padding(.horizontal,10)
        }
    }
}

struct CharactersGrid_Previews: PreviewProvider {
    static var previews: some View {
        CharactersGrid(characters: [])
    }
}
