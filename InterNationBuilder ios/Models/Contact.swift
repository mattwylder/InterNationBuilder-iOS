//
//  ContactExpanded.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

struct Contact: Codable, Identifiable {
    static let jordo = Contact(id: UUID(),
                               firstName: "Jordan",
                               lastName: "Quinn",
                               supportLevel: .strongSupport,
                               email: "jordan@quinn.com",
                               phone: "206-323-4232",
                               addresses: ["Registered": .mock,
                                           "Home": .mock])
    
    let id: UUID
    let firstName: String
    let lastName: String
    let supportLevel: SupportLevel
    let email: String
    let phone: String
    let addresses: [String: Address]
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var address: Address? {
        addresses.first?.value
    }
}
