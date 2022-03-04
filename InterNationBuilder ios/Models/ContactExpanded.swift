//
//  ContactExpanded.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

struct ContactExpanded:Codable {
    static let jordo = ContactExpanded(id: UUID(),
                                       firstName: "Jordan",
                                       lastName: "Quinn",
                                       emails: ["Home" : "jordan@quinn.com", "Work": "jq@sa.org"],
                                       phones: ["Mobile": "206-323-4232", "Work": "999-343-3245"],
                                       addresses: ["Registered": .mock,
                                                   "Home": .mock])
    
    let id: UUID
    let firstName: String
    let lastName: String
    let emails: [String: String]
    let phones: [String: String]
    let addresses: [String: Address]
}
