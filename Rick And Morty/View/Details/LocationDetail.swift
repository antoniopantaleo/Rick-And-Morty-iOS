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
            Section (header:Text("Type")) {
                Text(location.type)
            }
            Section (header:Text("Dimension")) {
                Text(location.dimension.capitalized)
            }
        }.listStyle(InsetGroupedListStyle())
        .navigationTitle(location.name)
    }
}

//struct LocationDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationDetail()
//    }
//}
