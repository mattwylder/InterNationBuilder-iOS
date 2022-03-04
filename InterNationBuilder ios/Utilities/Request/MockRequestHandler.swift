//
//  MockRequestHandler.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

struct MockRequestHandler: Requestable {
    
    enum JSONError: Error {
        case badBundle
    }
    
    func get<T:Codable>(from endpoint: String) async throws -> Result<T,Error> {
        guard let bundlepath = Bundle.main.path(forResource: endpoint, ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlepath).data(using: .utf8) else {
               throw JSONError.badBundle
        }
        
        do {
            return .success(try decoder.decode(T.self, from: jsonData))
        } catch {
            print(error)
            throw error
        }
    }
    
    func post<T:Codable>(to endpoint: String, object: T) async throws -> Result<Void, Error> {
        return .success(())
    }

}
