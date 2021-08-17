//
//  CharacterCell.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct CharacterCell: View {
    
    @State private var image : UIImage = UIImage()
    let character : Character
    
    var body: some View {
        NavigationLink(
            destination: CharacterDetail(character: character),
            label: {

                VStack(alignment:.leading) {
                    AsyncImage(url: character.image)
                        .cornerRadius(15)
                    
                    Text(character.name)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(.trailing,15)
                        .foregroundColor(Color(.label))
                    
                }
            })
        
    }
}

//struct CharacterCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCell()
//    }
//}
