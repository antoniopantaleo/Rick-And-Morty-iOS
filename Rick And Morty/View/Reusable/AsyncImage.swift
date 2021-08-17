//
//  AsyncImage.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 17/08/21.
//

import SwiftUI

struct AsyncImage: View {
    
    @State var url : String
    @State private var image : UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
        .resizable()
        .scaledToFit()
        .redacted(reason: image == UIImage() ? .placeholder : [])
            .onAppear {
                URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
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

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(url: "")
    }
}
