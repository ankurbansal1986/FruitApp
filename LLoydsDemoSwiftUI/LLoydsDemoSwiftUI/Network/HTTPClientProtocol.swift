//
//  HTTPClientProtocol.swift
//  LLOYDSDEMO
//
//  Created by Ankur Bansal on 05/01/24.
//

import Foundation
protocol HTTPClient {
    // send network request
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    // this will return true only in case unit test
    var isUnitTest: Bool {
        return (Bundle.main.object(forInfoDictionaryKey: Constants.isUnitTestKey) as? String ?? "") == Constants.isUnitTestValue
    }
    // send network request
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        if isUnitTest {
            return loadJSON(filename: endpoint.jsonFileName, type: responseModel)
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                let str = String(decoding: data, as: UTF8.self)
                print(str)
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
    
    // mock response
    private func loadJSON<T: Decodable>(filename: String, type: T.Type) -> Result<T, RequestError> {
        
        guard let path = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)
            
            return .success(decodedObject)
        } catch {
            return .failure(.unknown)
        }
    }
}
