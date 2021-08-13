//
//  LocationsView.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import SwiftUI

struct LocationsView: View {
    
    @ObservedObject private var viewModel = LocationsViewModel.shared
    
    var body: some View {
        Group {
            if viewModel.items.isEmpty {
                List {
                    HStack {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                        Spacer()
                    }
                }
            } else {
                List(viewModel.items) { location in
                    NavigationLink(
                        destination: LocationDetail(location: location),
                        label: {
                            Text(location.name)
                        })
                        .onAppear {
                            viewModel.shouldLoad(location)
                        }
                }
                
            }
        }
        .listStyle(InsetGroupedListStyle())
        .onAppear {
            viewModel.fetchMany()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
