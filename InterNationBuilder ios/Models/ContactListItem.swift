//
//  Contact.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 2/21/22.
//

import Foundation


struct ContactListItem: Codable, Identifiable {
    
    static let jordo = ContactListItem(id: "1",
                                       firstName: "Jordan",
                                       lastName: "Quinn",
                                       phone: "206-334-2342",
                                       email: "jordan@quinn.com",
                                       supportLevel: .strongSupport,
                                       address: .mock)
    
    static let champs = ContactListItem(id: "2",
                                        firstName: "Sarah",
                                        lastName: "Champernowne",
                                        phone: "206-994-3445",
                                        email: "sarah@champernowne.com",
                                        supportLevel: .weakSupport,
                                        address: .mock)
    
    enum SupportLevel: Int, Codable {
        case strongSupport = 1, weakSupport, undecided, weakOppose, strongOppose, unidentified
    }
    
    var id: String? //TODO: UUID?
    var firstName: String
    var lastName: String?
    var phone: String?
    var email: String?
    let supportLevel: SupportLevel?
    let address: Address?
    
    var fullName: String {
        guard let lastName = lastName else {
            return firstName
        }
        return "\(firstName) \(lastName)"
    }
}
