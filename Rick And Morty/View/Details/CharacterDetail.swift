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
    
    var body: some View {
        List {
            Section {
                
            Image(uiImage: image)
                .resizable()
                .clipShape(Circle())
                .redacted(reason: image == UIImage() ? .placeholder : [])
                .padding(.top)
                .listRowBackground(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)))
            }
                
            Section(header: Text("Status")) {
                VStack(alignment:.leading, spacing:20) {
                    Text(character.status.prettyString)
                }
            }
            Section (header: Text("Species")) {
                HStack {
                    Text(character.species)
                    if !character.type.isEmpty {
                        Text("(\(character.type))")
                    }
                }
            }
            
            Section (header: Text("Gender")) {
                    Text(character.gender.prettyString)
                }
            
            
            
        }
        .listStyle(InsetGroupedListStyle())
        .onAppear {
            URLSession.shared.dataTask(with: URL(string: character.image)!) { data, _, error in
                guard let data = data, error == nil else {return}
                guard let newImage = UIImage(data: data) else {return}
                DispatchQueue.main.async { [self] in
                    image = newImage
                }
            }.resume()
        }
        .navigationTitle(character.name)
    }
}

//struct CharacterDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetail()
//    }
//}
