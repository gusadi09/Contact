//
//  ContactTests.swift
//  ContactTests
//
//  Created by Gus Adi on 29/04/22.
//

import XCTest
import Moya
@testable import Contact

class ContactTests: XCTestCase {

	private let sut = UsersHelper()

	func test_success_getListUser() async throws {

		let expectation = XCTestExpectation(description: "UserListEndpointSuccess")

		do {
			let result = try await sut.stubGetListUser()

			XCTAssertEqual(result.page, 1)
			XCTAssertEqual((result.data?.count).orZero(), 1)
			XCTAssertEqual((result.data?.first?.firstName).orEmpty(), "Unit")
			expectation.fulfill()
		} catch {
			XCTFail(error.localizedDescription)
		}

		wait(for: [expectation], timeout: 10)
	}

}
