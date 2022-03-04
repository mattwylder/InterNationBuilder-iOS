//
//  Address.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

struct Address: Codable {
    static let mock = Address(address1: "1000 E Aloha St",
                              address2: "7",
                              city: "Seattle",
                              stateProvince: "WA",
                              postalCode: "98102")
    
    let address1: String
    let address2: String?
    let city: String
    let stateProvince: String
    let postalCode: String
}
