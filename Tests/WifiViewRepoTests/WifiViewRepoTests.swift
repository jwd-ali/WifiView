import XCTest
@testable import WifiViewRepo

final class WifiViewRepoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(WifiViewRepo().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
