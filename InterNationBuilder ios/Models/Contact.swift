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
                               emails: ["Home" : "jordan@quinn.com", "Work": "jq@sa.org"],
                               phones: ["Mobile": "206-323-4232", "Work": "999-343-3245"],
                               addresses: ["Registered": .mock,
                                           "Home": .mock])
    
    let id: UUID
    let firstName: String
    let lastName: String
    let supportLevel: SupportLevel
    let emails: [String: String]
    let phones: [String: String]
    let addresses: [String: Address]
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var phone: String? {
        phones.first?.value
    }
    
    var email: String? {
        emails.first?.value
    }
    
    var address: Address? {
        addresses.first?.value
    }
}
