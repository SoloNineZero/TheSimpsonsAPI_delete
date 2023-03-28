//
//  NetworkManager.swift
//  TheSimpsonsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import Foundation
import Alamofire

enum Link {
    case apiSimpsonsUrl
    
    var url: URL {
        switch self {
        case .apiSimpsonsUrl:
            return URL(string: "https://thesimpsonsquoteapi.glitch.me/quotes")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchQuote(from url: String, completion: @escaping(Result<[Quotes], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let quote = Quotes.getQuote(from: value)
                    completion(.success(quote))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
