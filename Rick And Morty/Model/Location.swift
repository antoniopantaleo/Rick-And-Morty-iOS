//
//  Location.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class Location : Decodable, Identifiable {
    
    let id : String
    let name : String
    let type : String
    let dimension : String
    let residents : [Character]
     
}

extension Location : Equatable {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    
}
