//
//  RequestHandler.swift
//  InterNationBuilder ios
//
//  Created by Matthew Wylder on 2/21/22.
//

import Foundation

struct RequestHandler {
    enum RequestError: Error {
        case badURL, badResponse, errorDecodingData, invalidURL
    }

    enum HTTPMethod: String {
        case POST, GET, PUT, DELETE
    }

    private struct NetworkConstants {
        static let MIMEType = "application/json"
        static let contentType = "Content-Type"
    }
    
    enum Endpoint: String {
        case contacts
    }
    
    enum APIHost {
        case local, heroku
        var baseURL: String {
            switch self {
            case .local: return "https://localhost:8080/"
            case .heroku: return "https://intern-nation-builder.herokuapp.com/"
            }
        }
    }
    
    static func post<T: Codable>(to endpoint: Endpoint, object: T, host: APIHost = .heroku) async throws {
        let url = URL(string: host.baseURL + endpoint.rawValue)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try! JSONEncoder().encode(object) //TODO: Remove force unwrap
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw RequestError.badResponse
        }
    }

    static func get<T: Codable>(endpoint: Endpoint, host: APIHost = .heroku) async throws -> T {
        let urlString = host.baseURL + endpoint.rawValue
        let url = URL(string: urlString)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw RequestError.badResponse
        }
        
        guard let object = try? JSONDecoder().decode(T.self, from: data) else {
            throw RequestError.errorDecodingData
        }
        
        return object
    }
}
