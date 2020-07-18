//  Copyright © 2018 Christian Tietze. All rights reserved. Distributed under the MIT License.

import XCTest
@testable import Version

class VersionTests: XCTestCase {
    static var allTests = [
        ("testComparison", testComparison),
        ("testInitFromString", testInitFromString)
    ]

    func testComparison() {
        XCTAssertEqual(Version(3,2,1), Version(3,2,1))

        XCTAssert(Version(1,0,0) < Version(2,0,0))
        XCTAssert(Version(1,0,0) < Version(1,1,1))
        XCTAssert(Version(1,0,0) < Version(1,1,0))
        XCTAssert(Version(1,0,0) < Version(1,0,1))

        XCTAssert(Version(1,0,1) < Version(2,0,0))
        XCTAssert(Version(1,0,1) < Version(1,0,2))
        XCTAssert(Version(1,0,1) < Version(1,1,0))
        XCTAssert(Version(1,0,1) < Version(1,1,1))
        XCTAssert(Version(1,0,1) < Version(1,1,2))

        XCTAssert(Version(1,1,0) < Version(2,0,0))
        XCTAssert(Version(1,1,0) < Version(1,1,1))
        XCTAssert(Version(1,1,0) < Version(1,2,0))
    }

    func testInitFromString() {
        XCTAssertEqual(try Version(string: "2.3.4"), Version(2,3,4))
        XCTAssertEqual(try Version(string: "2.1"), Version(2,1,0))
        XCTAssertEqual(try Version(string: "2"), Version(2,0,0))
        XCTAssertEqual(try Version(string: "0.1.2"), Version(0,1,2))
        XCTAssertEqual(try Version(string: "3"), Version(3,0,0))
        XCTAssertEqual(try Version(string: "0"), Version(0,0,0))

        XCTAssertEqual(try Version(string: "-1"), Version(1,0,0))
        XCTAssertEqual(try Version(string: "-1.0.0"), Version(1,0,0))
        XCTAssertEqual(try Version(string: "2.-1.0"), Version(2,1,0))
        XCTAssertEqual(try Version(string: "2.3.-4"), Version(2,3,4))
        XCTAssertEqual(try Version(string: "7.8.9.1"), Version(7,8,9))

        XCTAssertThrowsError(try Version(string: "x"))
        XCTAssertThrowsError(try Version(string: "x.y.z"))
    }

    func testDecoding() throws {
        let decoder = JSONDecoder()

        func decode(_ string: String) throws -> [String : Version] {
            try decoder.decode([String : Version].self, from: string.data(using: .utf8)!)
        }

        XCTAssertEqual(
            try decode("{\"version\": \"1.2.3\"}"),
            ["version" : Version(1, 2, 3)])
        XCTAssertEqual(
            try decode("{\"version\": \"1\"}"),
            ["version" : Version(1, 0, 0)])
        XCTAssertEqual(
            try decode("{\"version\": \"-5\"}"),
            ["version" : Version(5, 0, 0)])
        XCTAssertThrowsError(try decode("{\"version\": \"hello\"}"))
        XCTAssertThrowsError(try decode("{\"version\": \"\"}"))
    }

    func testEncoding() throws {
        let encoder = JSONEncoder()

        func encode(_ version: Version) throws -> String {
            let data = try encoder.encode(["ver" : version])
            return String(data: data, encoding: .utf8)!
        }

        XCTAssertEqual(
            try encode(Version(1,2,3)),
            "{\"ver\":\"1.2.3\"}")
        XCTAssertEqual(
            try encode(Version(5,0,4)),
            "{\"ver\":\"5.0.4\"}")
    }
}
