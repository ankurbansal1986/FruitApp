//
//  Endpoint.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 05/01/24.
//

import Foundation
// request methods
enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

// enum for error
enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return String(localized: "Decode error", table: "FruitsLocalization")
        case .unauthorized:
            return String(localized: "Session expired", table: "FruitsLocalization")
        default:
            return String(localized: "Unknown error", table: "FruitsLocalization")
        }
    }
}
// protocol to specify endpint properties for network request
protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var jsonFileName: String {get}
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "www.fruityvice.com"
    }
    
    var header: [String: String]? {
        return nil
    }
    
    var body: [String: String]? {
        return nil
    }
    
    var jsonFileName: String {
        return ""
    }
}
