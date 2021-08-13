//
//  ViewModel.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class ViewModel<T:Equatable> : ObservableObject, ViewModelProtocol {
    
    @Published var items : [T] = []
    var nextUrl : String?
    
    func shouldLoad(_ item : T) {
        guard let last = items.last else {return}
        if item == last, nextUrl != nil {
            fetchMany()
        }
    }
    
    func fetchMany() { fatalError("Abstract Method") }

}
