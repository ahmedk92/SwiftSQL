// The MIT License (MIT)
//
// Copyright (c) 2020 Alexander Grebenyuk (github.com/kean).

import XCTest
import Foundation
import CoreData
import SwiftSQL

final class DatabaseTests: XCTestCase {
    var tempDir: TempDirectory!

    override func setUp() {
        super.setUp()

        tempDir = try! TempDirectory()
    }

    override func tearDown() {
        super.tearDown()

        try! tempDir.destroy()
    }

    func testInit() {
        // WHEN/THEN
        let url = tempDir.file(named: "temp-db")
        XCTAssertNoThrow(try SQLConnection(url: url))
    }
}
