//
//  ContactDetailViewModel.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

final class ContactDetailViewModel: ObservableObject {
    let contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    
    var name: String {
        return "\(contact.firstName) \(contact.lastName)"
    }
    
    var addresses: [(String, Address)] {
        return tupleArray(from: contact.addresses)
    }
    
    private func tupleArray<T>(from dict: [String: T]) -> [(String, T)] {
        var result = [(String, T)]()
        for key in dict.keys {
            result.append((String(key), dict[key]!))
        }
        return result
    }
    
    func sellPaper() {
        
    }
}
