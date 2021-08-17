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
                return "🪴 Alive"
            case .dead:
                return "💀 Dead"
            case .unknown:
                return "❓ Unknown"
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
                return "♂︎ Male"
            case .female:
                return "♀︎ Female"
            case .genderless:
                return "⚬ Genderless"
            case .unknown:
                return "❓ Unkown"
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
