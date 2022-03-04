//
//  ContactsList.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation
import SwiftUI

final class ContactsList: ObservableObject {
    @Published var contacts: [Contact]
    private let requestHandler: Requestable
    
    init(_ requestHandler: Requestable) {
        self.contacts = []
        self.requestHandler = requestHandler
    }
    
    func fetchContacts() async {
        do {
            let result: Result<[Contact], Error> = try await requestHandler.get(from: "contacts")
            DispatchQueue.main.async {
                switch result {
                case .success(let contacts):
                    self.contacts = contacts
                case .failure:
                    break //TODO: handle error
                }
            }
        } catch {
            //TODO: Implement
        }
    }
}
