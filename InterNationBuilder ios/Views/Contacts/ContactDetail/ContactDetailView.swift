//
//  ContactDetailView.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct ContactDetailView: View {
    @ObservedObject var viewModel: ContactDetailViewModel
    
    init(_ contact: Contact) {
        self.viewModel = ContactDetailViewModel(contact)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.contact.fullName)
                    .font(.title2)
                SupportLevelBadge(supportLevel: viewModel.contact.supportLevel)
            }
            HStack {
                Button(action: viewModel.sellPaper) {
                    Image(systemName: "newspaper.fill")
                        .padding(6)
                        .background(.background)
                }
            }
            List {
                Section("Email") {
                    Text(viewModel.contact.email)
                }
                
                Section("Phone") {
                    Text(viewModel.contact.phone)
                }
                
                ContactInfoSection(name: "Address", array: viewModel.addresses) { address in
                    Text((address.address1))
                    if let address2 = address.address2 {
                        Text(address2)
                    }
                    Text("\(address.city) \(address.stateProvince) \(address.postalCode)")
                }
            }
        }
        .navigationTitle(viewModel.contact.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactDetailView(Contact.jordo)
        }
    }
}
