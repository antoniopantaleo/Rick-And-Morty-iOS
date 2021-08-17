//
//  LocationsViewModel.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation
import Apollo

class LocationsViewModel : ViewModel<Location> {
    
    override init() { super.init() }
    
    override func fetchMany() {
        ApolloManager.perform(query: AllLocationsQuery(page: next)) { [self] (response : APIResponse<Location>) in
            next = response.info.next
            DispatchQueue.main.async {
                items.append(contentsOf: response.results)
            }
        }
    }
    
}
