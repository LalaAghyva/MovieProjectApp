//
//  PeopleManagerTest.swift
//  MovieProjectAppTests
//
//  Created by Lala on 15.08.24.
//

import XCTest
@testable import MovieProjectApp

final class PeopleManagerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPeopleDecode() {
        if let file = Bundle.main.url(forResource: "PopularPeople", withExtension: "json"),
           let data = try? Data(contentsOf: file) {
            XCTAssertNoThrow(try JSONDecoder().decode(People.self, from: data))
        }
    }
    
    func testPeopleError() {
        PeopleManager.shared.getPopularPeople(page: 1) { people, error in
            XCTAssertNil(error)
            XCTAssertNotNil(people)
        }
    }
    
    func testPeopleCount() {
        PeopleManager.shared.getPopularPeople(page: 1) { people, error in
            XCTAssertNotEqual(people?.result?.count, 0)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
