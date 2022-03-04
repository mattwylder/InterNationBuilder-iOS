//
//  ContactInfoSection.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct ContactInfoSection<T, Content>: View where Content: View {
    let name: String
    let array: [(String, T)]
    @ViewBuilder let content: (T) -> Content

    var body: some View {
        Section(name) {
            ForEach(0..<array.count) {index in
                VStack(alignment: .leading) {
                    let tuple = array[index]
                    Text(tuple.0)
                        .font(.caption)
                    content(tuple.1)
                }
            }
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactInfoSection()
//    }
//}
