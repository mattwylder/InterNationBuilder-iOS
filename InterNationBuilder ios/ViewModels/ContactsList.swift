//
//  ContactsList.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation
import SwiftUI

final class ContactsList: ObservableObject {
    @Published var contacts: [ContactListItem]
    
    init() {
        self.contacts = [ContactListItem.jordo, ContactListItem.champs]
    }
}
