//
//  PatternBootcampTests.swift
//  PatternBootcampTests
//
//  Created by Gustavo Evangelista on 21/06/24.
//

import XCTest
@testable import PatternBootcamp

final class PatternBootcampTests: XCTestCase {

    var sut: ViewController!
    
    override func setUp() {
        sut = ViewController()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testExample() throws {
        let result = sut.soma(a: 1, b: 2)
        XCTAssertEqual(result, 3)
    }

}
