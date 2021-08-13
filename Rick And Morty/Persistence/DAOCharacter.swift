//
//  DAOCharacter.swift
//  Rick And Morty
//
//  Created by Antonio Pantaleo on 13/08/21.
//

import Foundation

class DAOCharacter : DAO {
    
    func fetchMany(completion: @escaping ((Result<[Character], Error>) -> ())) {
        guard let url = URL(string: "\(APIManager.baseUrl)/character") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { completion(.failure(error!)); return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String:Any]
                guard let results = json?["results"] as? [String:Any] else {return}
                let resultsData = try JSONSerialization.data(withJSONObject: results, options: .fragmentsAllowed)
                let decoded = try JSONDecoder().decode([Character].self, from: resultsData)
                print("Decoded")
                completion(.success(decoded))
                
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func fetchOne(completion: @escaping ((Result<Character, Error>) -> ())) {
        
    }

    
}
