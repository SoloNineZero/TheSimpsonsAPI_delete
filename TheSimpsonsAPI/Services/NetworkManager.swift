//
//  NetworkManager.swift
//  TheSimpsonsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import Foundation

enum Link {
    case apiSimpsonsURL
    
    var url: URL {
        switch self {
        case .apiSimpsonsURL:
            return URL(string: "https://thesimpsonsquoteapi.glitch.me/quotes")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
}
