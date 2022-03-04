//
//  InterNationBuilder_iosApp.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 2/21/22.
//

import SwiftUI

@main
struct InterNationBuilderApp: App {
    let requestHandler: Requestable = MockRequestHandler(waitTime: 1)
    var body: some Scene {
        WindowGroup {
            HomeTabView(requestHandler)
        }
    }
}
