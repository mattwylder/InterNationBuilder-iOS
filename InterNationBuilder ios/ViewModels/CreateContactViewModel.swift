//
//  CreateContactViewModel.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 2/21/22.
//

import Foundation

final class CreateContactViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    
    //TODO: Refactor this out into some other object owned by view? presenter or whatever?
    func submitContact() async throws {
        let contact = ContactListItem(firstName: firstName,
                              lastName: lastName.isEmpty ? nil : lastName,
                              phone: phone.isEmpty ? nil : phone,
                              email: email.isEmpty ? nil : email,
                              supportLevel: nil,
                              address: nil)

    }
    
}
