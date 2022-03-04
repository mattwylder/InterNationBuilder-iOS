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
    
    func submitContact() async throws {
        //TODO: implement
    }
    
}
