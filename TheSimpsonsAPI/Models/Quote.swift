//
//  Quote.swift
//  TheSimpsonsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import Foundation

enum Link: String {
    case apiSimpsonsUrl
    
    var url: URL {
        switch self {
        case .apiSimpsonsUrl:
            return URL(string: "https://thesimpsonsquoteapi.glitch.me/quotes")!
        }
    }
}

struct Quotes: Decodable {
    let quote: String
    let character: String
    let image: String
}

