//
//  Info.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class Info : Decodable {
    
    let count : Int
    let pages : Int
    let next : String?
    let prev : String?
    
}
