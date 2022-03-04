//
//  InterNationBuilder_iosTests.swift
//  InterNationBuilder iosTests
//
//  Created by Matthew Wylder on 3/3/22.
//

import XCTest
@testable import InterNationBuilder_ios

class InterNationBuilder_iosTests: XCTestCase {

    func testMockRequestHandler() async throws {
        let mockRequestHandler = MockRequestHandler()
        let papersales: [PaperSaleListItem] = try await mockRequestHandler.get(from: "papersales")
        guard let first = papersales.first else {
            XCTFail()
            return
        }
        XCTAssert(first.purchaserName == "Jordan Quinn")
    }

}
