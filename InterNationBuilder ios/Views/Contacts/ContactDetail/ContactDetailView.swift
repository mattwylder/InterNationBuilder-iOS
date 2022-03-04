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
                ContactInfoSection(name: "Email", array: viewModel.emails) { email in
                    Text(email)
                }
                
                ContactInfoSection(name: "Phone", array: viewModel.phones) { number in
                    Text(number)
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
