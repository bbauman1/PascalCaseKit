import XCTest
@testable import PascalCaseKit

final class PascalCaseKitTests: XCTestCase {

    func testRawValueConversion() {
        let testCases = Example.allCases
        let actual = testCases.map(\.rawValue)
        let expected = testCases.map(\.expectedPascalCaseValue)
        XCTAssertEqual(actual, expected)
    }
}

private enum Example: String, PascalCaseRepresentable, CaseIterable {
    case helloWorld
    case x
    case _2x
    case someAbbreviationLikeURL

    var expectedPascalCaseValue: String {
        switch self {
        case .helloWorld:
            return "HelloWorld"
        case .x:
            return "X"
        case ._2x:
            return "_2x"
        case .someAbbreviationLikeURL:
            return "SomeAbbreviationLikeURL"
        }
    }
}
