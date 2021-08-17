//
//  CharactersViewModel.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class CharactersViewModel : ViewModel<Character> {
    
    override init() { super.init() }
    
    override func fetchMany() {
        ApolloManager.perform(query: AllCharactersQuery(page: next)) { [self] (response: APIResponse<Character>) in
            next = response.info.next
            DispatchQueue.main.async {
                items.append(contentsOf: response.results)
            }
        }
    }
}
