//
//  ViewModel.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

protocol ViewModelProtocol {
    
    func fetchMany()
    
}

class ViewModel<T:Equatable> : ObservableObject, ViewModelProtocol {
    
    var nextUrl : String?
    //var completion : (()->())!
    @Published var items : [T] = []
    
    func shouldLoad(_ item : T) {
        guard let last = items.last else {return}
        if item == last, nextUrl != nil {
            fetchMany()
        }
    }
    
    func fetchMany() { fatalError("Abstract Method") }

}
