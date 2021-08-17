//
//  CharacterDetail.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct CharacterDetail: View {
    
    let character : Character
    @State private var image : UIImage = UIImage()
    private let size = UIScreen.main.bounds.height * 0.3
    
    var body: some View {
        List {
            Section {
                
                HStack {
                    Spacer()
                    AsyncImage(url: character.image)
                        .frame(width: size, height: size)
                        .clipShape(Circle())
                    Spacer()
                }
                .listRowBackground(Color("background"))
            }
                
            Section(header: Text("Status").foregroundColor(Color(.label))) {
                VStack(alignment:.leading, spacing:20) {
                    Text(character.status.prettyString)
                }
            }
            
            Section (header: Text("Gender").foregroundColor(Color(.label))) {
                Text(character.gender.prettyString)
            }
            
            Section (header: Text("Species").foregroundColor(Color(.label))) {
                HStack {
                    Text(character.species.capitalized)
                    if !character.type.isEmpty {
                        Text("(\(character.type.capitalized))")
                    }
                }
            }
            
            
            
            
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(character.name)
    }
}

//struct CharacterDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetail()
//    }
//}
