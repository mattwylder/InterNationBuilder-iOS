//
//  PaperSale.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

struct PaperSaleListItem: Codable, Identifiable {
    
    static let mock1 = PaperSaleListItem(id: UUID(),
                                         purchaserId: UUID(),
                                         date: Date(),
                                         purchaserName: "Jordan Quinn",
                                         purchaserEmail: "jq@sa.org",
                                         purchaserPhone: "984-323-2344")
    
    let id: UUID
    let purchaserId: UUID
    let date: Date
    let purchaserName: String
    let purchaserEmail: String
    let purchaserPhone: String
}
