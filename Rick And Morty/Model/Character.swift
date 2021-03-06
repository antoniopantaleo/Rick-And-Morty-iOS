//
//  Character.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class Character : Decodable, Identifiable {
    
    enum Status : String, Decodable, Prettifiable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown
        
        var prettyString : String {
            switch self {
            case .alive:
                return "ðŠī Alive"
            case .dead:
                return "ð Dead"
            case .unknown:
                return "â Unknown"
            }
        }
    }
    
    enum Gender : String, Decodable, Prettifiable {
        
        case male = "Male"
        case female = "Female"
        case genderless = "Genderless"
        case unknown
        
        var prettyString: String {
            switch self {
            case .male:
                return "âïļ Male"
            case .female:
                return "âïļ Female"
            case .genderless:
                return "âŽ Genderless"
            case .unknown:
                return "â Unkown"
            }
        }
        
    }
    
    let id : String
    let name : String
    let status : Status
    let species : String
    let type : String
    let gender : Gender
    let image : String
    
}

extension Character : Equatable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
    
}
