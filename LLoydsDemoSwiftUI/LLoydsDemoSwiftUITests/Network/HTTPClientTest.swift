//
//  HTTPClientTest.swift
//  LLoydsDemoSwiftUITests
//
//  Created by Ankur Bansal on 23/01/24.
//

import XCTest
@testable import LLoydsDemoSwiftUI

final class HTTPClientTest: XCTestCase {
    
    func testSendRequest() {
        // positive scenarios
        Task {
            let service = MockService()
            let result = await service.getAllFruits(endPoint: MockEndpoint())
            guard case .success(let fruitList) = result else {
                
                return XCTFail("Expected to be a success but got a failure")
            }
            XCTAssertNotNil(fruitList)
            XCTAssertNotNil(service.url)
            XCTAssertTrue(service.url?.absoluteString == "https://www.fruityvice.com//api/fruit/all")
            XCTAssertNotNil(service.request)
            XCTAssertTrue(service.request?.httpMethod == RequestMethod.get.rawValue)
        }
        
        // negative scenarios
        Task {
            let service = MockService()
            let result = await service.getAllFruits(endPoint: MockNegativeEndpoint(path: " ", jsonFileName: "AllFruits" ))
            
            guard case .failure(_) = result else {
                return XCTFail("Expected to be a fail but got success")
            }
        }
        
        Task {
            let service = MockService()
            let result = await service.getAllFruits(endPoint: MockNegativeEndpoint(path: "/api/fruit/all", jsonFileName: "" ))
            
            guard case .failure(_) = result else {
                return XCTFail("Expected to be a fail but got success")
            }
        }
    }
}

// Endpoint to test positive scenarios
struct MockEndpoint: Endpoint {
    var path: String {
        return "/api/fruit/all"
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var jsonFileName: String {
        return "AllFruits"
    }
}

// Endpoint to test negative scenarios
struct MockNegativeEndpoint: Endpoint {
    var path: String
    
    var method: RequestMethod {
        return .get
    }
    
    var jsonFileName: String
}

// network service for fruits
protocol MockServiceable {
    func getAllFruits(endPoint: Endpoint) async -> Result<[FruitModel], RequestError>
}

struct MockService: HTTPClient, MockServiceable {
    var url: URL?
    var request: URLRequest?
    func getAllFruits(endPoint: Endpoint) async -> Result<[FruitModel], RequestError> {
        return await sendRequest(endpoint: MockEndpoint(), responseModel: [FruitModel].self)
    }
    
    // send network request
    mutating func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        self.url = url
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        self.request = request
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        if isUnitTest {
            return loadJSON(filename: endpoint.jsonFileName, type: responseModel)
        } else {
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
