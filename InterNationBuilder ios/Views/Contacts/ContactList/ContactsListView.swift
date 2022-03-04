//
//  ContactsListView.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct ContactsListView: View {
    @State private var isLoading: Bool
    @ObservedObject var contactList: ContactsList
    
    init(_ requestHandler: Requestable) {
        contactList = ContactsList(requestHandler)
        isLoading = true
    }
    
    var body: some View {
        List {
            ForEach(contactList.contacts) { contact in
                NavigationLink(destination: ContactDetailView(contact)) {
                    ContactRow(contact: contact)
                }
            }
        }
        .navigationTitle("Contacts")
        .overlay(ProgressView().opacity(isLoading ? 1 : 0))
        .onAppear {
            Task {
                isLoading = true
                await contactList.fetchContacts()
                isLoading = false
            }
        }
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(MockRequestHandler())
    }
}
