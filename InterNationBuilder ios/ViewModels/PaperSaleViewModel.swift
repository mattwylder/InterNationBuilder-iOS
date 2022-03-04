//
//  PaperSaleViewModel.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

final class PaperSaleViewModel: ObservableObject {
    @Published var paperSales: [PaperSaleListItem]
    
    init() {
        paperSales = [.mock1]
    }
    
}
