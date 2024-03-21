//
//  FruitsListServiceTest.swift
//  LLoydsDemoSwiftUITests
//
//  Created by Ankur Bansal on 21/03/24.
//

import Foundation
import XCTest


@testable import LLoydsDemoSwiftUI
import SwiftUI
final class FruitsListServiceTest: XCTestCase {

    func testEndPoint() {
        let endPoint = AllFruitsListEndpoint()
        XCTAssertEqual(endPoint.path, "/api/fruit/all")
        XCTAssertEqual(endPoint.jsonFileName, "AllFruits")
        XCTAssertEqual(endPoint.method, RequestMethod.get)
        XCTAssertEqual(endPoint.scheme, "https")
        XCTAssertEqual(endPoint.host, "www.fruityvice.com")
        XCTAssertEqual(endPoint.header, nil)
        XCTAssertEqual(endPoint.body, nil)
    }
}
