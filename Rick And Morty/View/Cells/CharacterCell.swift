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
    private let size : CGFloat = UIScreen.main.bounds.width / 2.2
    
    var body: some View {
        NavigationLink(
            destination: CharacterDetail(character: character),
            label: {
                
                
                VStack(alignment:.leading) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:size,height:size)
                        .cornerRadius(15)
                        .redacted(reason: image == UIImage() ? .placeholder : [])
                    
                    Text(character.name)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(.trailing,15)
                        .foregroundColor(Color(.label))
                    
                }
            })
            .onAppear {
                URLSession.shared.dataTask(with: URL(string: character.image)!) { data, _, error in
                    guard let data = data, error == nil else {return}
                    guard let newImage = UIImage(data: data) else {return}
                    DispatchQueue.main.async { [self] in
                        image = newImage
                    }
                }.resume()
            }
            .onDisappear {
                image = UIImage()
            }
        
    }
}

//struct CharacterCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCell()
//    }
//}
