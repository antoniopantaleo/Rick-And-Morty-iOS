//
//  CharactersViewModel.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class CharactersViewModel : ViewModel<Character> {
    
    override init() {
        super.init()
    }
    
    override func fetchMany() {
        let url = nextUrl == nil ? "\(APIManager.baseUrl)/character" : nextUrl!
        APIManager.fetchMany(url: url) { [self] (result : Result<APIResponse<Character>,Error>) in
            if case let .success(response) = result {
                nextUrl = response.info.next
                DispatchQueue.main.async {
                    items.append(contentsOf: response.results)
                }
            } else {
                print("ERROR")
            }
        }
    }
    
    
}
