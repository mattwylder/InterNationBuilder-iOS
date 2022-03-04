//
//  PaperSaleList.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import SwiftUI

struct PaperSaleList: View {
    @ObservedObject var viewModel = PaperSaleViewModel()
    let formatter = DateFormatter()
    
    init() {
        formatter.dateFormat = "MM/DD/YY"
    }
    
    var body: some View {
        List {
            ForEach(viewModel.paperSales) { sale in
                VStack(alignment: .leading) {
                    Text(sale.purchaserName)
                    Text(formatter.string(from: sale.date))
                }
            }
        }.navigationTitle("Paper Sales")
    }
}

struct PaperSaleList_Previews: PreviewProvider {
    static var previews: some View {
        PaperSaleList()
    }
}
