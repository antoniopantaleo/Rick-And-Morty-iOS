//
//  Prettifiable.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

protocol Prettifiable {
    var prettyString : String { get }
}

protocol ViewModelProtocol {
    func fetchMany()
}
