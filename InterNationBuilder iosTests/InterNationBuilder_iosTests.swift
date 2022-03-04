//
//  InterNationBuilder_iosTests.swift
//  InterNationBuilder iosTests
//
//  Created by Matthew Wylder on 3/3/22.
//

import XCTest
@testable import InterNationBuilder_ios

class InterNationBuilder_iosTests: XCTestCase {

    func testMockRequestHandler_papersales() async throws {
        let mockRequestHandler = MockRequestHandler()
        let result: Result<[PaperSaleListItem], Error> = try await mockRequestHandler.get(from: "paper_sales")
        guard case .success(let paperSales) = result, let first = paperSales.first else {
            XCTFail()
            return
        }
        XCTAssert(first.purchaserName == "Jordan Quinn")
    }
    
    func testMockRequestHandler_contacts() async throws {
        let requestHandler = MockRequestHandler()
        let result: Result<[Contact], Error> = try await requestHandler.get(from: "contacts")
        guard case .success(let contacts) = result else {
            XCTFail()
            return
        }
        XCTAssert(contacts.count == 2)
    }

}
