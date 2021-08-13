//
//  LocationDetail.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct LocationDetail: View {
    
    let location : Location
    
    var body: some View {
        List {
            Section (header:Text("Type").foregroundColor(Color(.label))) {
                Text(location.type)
            }
            Section (header:Text("Dimension").foregroundColor(Color(.label))) {
                Text(location.dimension.capitalized)
            }
            if !location.residents.isEmpty {
            Section (header:Text("Residents").foregroundColor(Color(.label))) {
                NavigationLink(
                    destination: CharactersGrid(characters: location.residents)
                        .navigationTitle("Residents"),
                    label: {
                        Text("See all")
                    })
                
            }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .frame(height:UIScreen.main.bounds.height)
        .navigationTitle(location.name)
    }
}

//struct LocationDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationDetail()
//    }
//}
