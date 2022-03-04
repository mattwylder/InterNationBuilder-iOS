//
//  ContactDetailViewModel.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

final class ContactDetailViewModel: ObservableObject {
    let contact: ContactListItem
    @Published var contactExpanded: ContactExpanded?
    
    init(_ contact: ContactListItem) {
        self.contact = contact
        self.contactExpanded = .jordo
    }
    
    var name: String {
        if let contactExpanded = contactExpanded {
            return "\(contactExpanded.firstName) \(contactExpanded.lastName)"
        }
        return "\(contact.firstName) \(contact.lastName!)"
    }
    
    var emails: [(String, String)] {
        guard let contactExpanded = contactExpanded else {
            return [("Primary", contact.email!)]
        }
        return tupleArray(from: contactExpanded.emails)
    }
    
    var phones: [(String, String)] {
        guard let contactExpanded = contactExpanded else {
            return [("Primary", contact.phone!)]
        }
        return tupleArray(from: contactExpanded.phones)
    }
    
    var addresses: [(String, Address)] {
        guard let contactExpanded = contactExpanded else {
            return [("Primary", contact.address!)]
        }
        return tupleArray(from: contactExpanded.addresses)
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
