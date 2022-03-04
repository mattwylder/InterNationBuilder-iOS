//
//  ContactsListView.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct ContactsListView: View {
    @ObservedObject var contactList = ContactsList()
    
    var body: some View {
        List {
            ForEach(contactList.contacts) { contact in
                NavigationLink(destination: ContactDetailView(contact)) {
                    ContactRow(contact: contact)
                }
            }
        }
        .navigationTitle("Contacts")
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView()
    }
}
