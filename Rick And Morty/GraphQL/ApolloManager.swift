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
    
    /**
     Performs a fetch request based on a GraphQL query
     
    Standard query:
     ```
     ApolloManager.perform(query: MyGraphQLQuery()) { (response : APIResponse<MyReturnData>) in
        // Update the UI
     }
     ```
     
    Query with parameters:
     ```
     ApolloManager.perform(query: MyGraphQLQuery(param: myParam) { (response : APIResponse<MyReturnData>) in
        // Update the UI
     }
     ```
     
     - parameter query: GraphQL query to perform
     - parameter completion: Handles the APIResponse
     - Returns: An APIResponse<U> object where U is the decoded data wanted
     */
    static func perform<T:GraphQLQuery, U: Decodable>(query : T, completion: @escaping ((APIResponse<U>)->())) {
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
