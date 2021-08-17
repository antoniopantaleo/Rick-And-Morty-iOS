//
//  Prettifiable.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

/// Used to provide a prettified version ...
protocol Prettifiable {
    
    /// Prettified string
    var prettyString : String { get }
}

protocol ViewModelProtocol {
    func fetchMany()
}
