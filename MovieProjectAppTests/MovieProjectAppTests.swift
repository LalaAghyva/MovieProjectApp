//
//  MovieProjectAppTests.swift
//  MovieProjectAppTests
//
//  Created by Lala on 15.08.24.
//

import XCTest
@testable import MovieProjectApp

final class MovieProjectAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSum() {
        let operation = OperationClass()
        let result = operation.sum(1, 2)
        XCTAssertEqual(result, 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
