//
//  Location.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class Location : Decodable, Identifiable {
    
    private enum CodingKeys : String, CodingKey {
     case id, name, type, dimension, residents
    }
    
    let id : Int
    let name : String
    let type : String
    let dimension : String
    var residents : [Character] { _residents }
    
    private var _residents : [Character] = []
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        dimension = try container.decode(String.self, forKey: .dimension)
        let residentsUrls = try container.decode([String].self, forKey: .residents)
        for url in residentsUrls {
            APIManager.fetchOne(url: url) { [weak self] (result: Result<Character, Error>) in
                if case let .success(character) = result {
                    self?._residents.append(character)
                }
            }
        }
    }
    
}

extension Location : Equatable {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    
}
