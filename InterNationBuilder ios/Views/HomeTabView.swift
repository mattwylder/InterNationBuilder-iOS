//
//  HomeTabView.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct HomeTabView: View {
    let requestHandler: Requestable
    init(_ requestHandler: Requestable) {
        self.requestHandler = requestHandler
    }
    var body: some View {
        TabView {
            NavigationView {
                ContactsListView(requestHandler)
            }.tabItem {
                Image(systemName: "person.3")
                Text("Contacts")
            }
            
            NavigationView {
                PaperSaleList()
            }.tabItem {
                Image(systemName: "newspaper")
                Text("Paper Sales")
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(MockRequestHandler())
    }
}
