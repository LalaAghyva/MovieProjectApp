//
//  AppLanguageTest.swift
//  MovieProjectAppTests
//
//  Created by Lala on 15.08.24.
//

import XCTest
@testable import MovieProjectApp

final class AppLanguageTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLocalize() {
        UserDefaults.standard.set("az", forKey: "appLang")
        let title = "home_title".localize
        XCTAssertEqual(title, "Kinolar")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
