//
//  APIManager.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class APIManager {
    
    static let baseUrl = "https://rickandmortyapi.com/api"
    
    static func fetchMany<T:Decodable>(url: String, completion: @escaping ((Result<APIResponse<T>,Error>)->()) ) {
        guard let url = URL(string: url) else {print("URL ERROR");return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { completion(.failure(error!)); return }
            do {
                let response = try JSONDecoder().decode(APIResponse<T>.self, from: data)
                completion(.success(response))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
    
}
