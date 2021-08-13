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
                .listRowBackground(Color("background"))
            }
                
            Section(header: Text("Status").foregroundColor(Color(.label))) {
                VStack(alignment:.leading, spacing:20) {
                    Text(character.status.prettyString)
                }
            }
            Section (header: Text("Species").foregroundColor(Color(.label))) {
                HStack {
                    Text(character.species.capitalized)
                    if !character.type.isEmpty {
                        Text("(\(character.type.capitalized))")
                    }
                }
            }
            
            Section (header: Text("Gender").foregroundColor(Color(.label))) {
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
