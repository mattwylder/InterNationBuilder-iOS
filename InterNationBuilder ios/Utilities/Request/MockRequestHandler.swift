//
//  MockRequestHandler.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 3/3/22.
//

import Foundation

struct MockRequestHandler: Requestable {
    let waitTime: Double

    enum JSONError: Error {
        case badBundle
    }
    
    init(waitTime: Double = 0) {
        self.waitTime = waitTime
    }
    
    func get<T:Codable>(from endpoint: String) async throws -> Result<T,Error> {
        if waitTime > 0 {
            try await Task.sleep(nanoseconds: UInt64(waitTime * Double(NSEC_PER_SEC)))
        }
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
        if waitTime > 0 {
            try await Task.sleep(nanoseconds: UInt64(waitTime * Double(NSEC_PER_SEC)))
        }
        return .success(())
    }

}
