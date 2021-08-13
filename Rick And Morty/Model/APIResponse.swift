//
//  APIResponse.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class APIResponse<T:Decodable> : Decodable {
    
    let info : Info
    let results : [T]
    
}
