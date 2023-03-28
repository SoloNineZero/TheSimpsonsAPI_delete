//
//  NetworkManager.swift
//  TheSimpsonsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(for url: String, completion: @escaping(Result<[Quotes], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let quotes = Quotes.getQuotes(from: value)
                    completion(.success(quotes))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func fetchImage(from url: String, completion: @escaping(Data) -> Void) {
        AF.request(url).validate().responseData { data in
            switch data.result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
