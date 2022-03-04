//
//  ContentView.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 2/21/22.
//

import SwiftUI

struct CreateContactView: View {
    @ObservedObject var viewModel = CreateContactViewModel()
    
    var body: some View {
        VStack {
            TextField("first name", text: $viewModel.firstName)
            TextField("last name", text: $viewModel.lastName)
            TextField("phone", text: $viewModel.phone)
            TextField("email", text: $viewModel.email)
            Button {
                Task {
                    try await viewModel.submitContact()
                }
            } label: {
                Text("Submit")
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateContactView()
    }
}
