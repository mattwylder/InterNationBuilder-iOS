//
//  NetworkModel.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 2/21/22.
//

import Foundation

protocol NetworkModel: Codable {
    static var endpoint: String { get }
}
