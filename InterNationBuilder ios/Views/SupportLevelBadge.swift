//
//  SupportLevelView.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct SupportLevelBadge: View {
    let supportLevel: SupportLevel
    
    private var bubbleColor: Color {
        switch supportLevel {
        case .strongSupport: return .green
        case .weakSupport: return .blue
        case .undecided: return .yellow
        case .weakOppose: return .purple
        case .strongOppose: return .red
        case .unidentified: return .gray
        }
    }
    
    var body: some View {
        Text("\(supportLevel.number)")
            .font(.caption)
            .fontWeight(.black)
            .padding(6)
            .background(bubbleColor)
            .clipShape(Circle())
            .foregroundColor(.white)
    }
}

struct SupportLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SupportLevelBadge(supportLevel: .unidentified)
    }
}
