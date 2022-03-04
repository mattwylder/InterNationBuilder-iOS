//
//  ContactRow.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text(contact.phone!)
                Text(contact.email!)
            }
            Spacer()
            SupportLevelBadge(supportLevel: contact.supportLevel)
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(contact: .jordo)
    }
}
