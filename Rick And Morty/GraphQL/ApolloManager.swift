//
//  ApolloManager.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 17/08/21.
//

import Foundation
import Apollo

class ApolloManager {
    
    static private var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    static func fetchAll<T:GraphQLQuery, U: Decodable>(query : T, completion: @escaping ((APIResponse<U>)->())) {
        apollo.fetch(query: query) { result in
            if case let .success(data) = result {
                guard let data = data.data, let json = data.jsonObject.first?.value else {return}
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
                    let response = try JSONDecoder().decode(APIResponse<U>.self, from: jsonData)
                    completion(response)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
