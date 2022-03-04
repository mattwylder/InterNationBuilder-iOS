//
//  SupportLevel.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/4/22.
//

import Foundation

enum SupportLevel: String, Codable {
    case strongSupport = "strong_support"
    case weakSupport = "weak_support"
    case undecided = "undecided"
    case weakOppose = "weak_oppose"
    case strongOppose = "strong_oppose"
    case unidentified = "unidentified"
    
    var number: String {
        switch self {
        case .strongSupport: return "1"
        case .weakSupport: return "2"
        case .undecided: return "3"
        case .weakOppose: return "4"
        case .strongOppose: return "5"
        case .unidentified: return "?"
        }
    }
}
