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

	func test_success_getSingleUser() async throws {

		let expectation = XCTestExpectation(description: "SingleUserEndpoint")

		do {
			let result = try await sut.stubGetSingleUser()

			XCTAssertEqual(result.id.orZero(), 1)
			expectation.fulfill()
		} catch {
			XCTFail(error.localizedDescription)
		}

		wait(for: [expectation], timeout: 10)
	}

	func test_success_addContact() async throws {
		let expectation = XCTestExpectation(description: "AddContactEndpoint")

		do {
			let result = try await sut.stubCreateUser()

			XCTAssertEqual(result.firstName.orEmpty(), "test")
			XCTAssertEqual(result.lastName.orEmpty(), "unit")
			expectation.fulfill()
		} catch {
			XCTFail(error.localizedDescription)
		}

		wait(for: [expectation], timeout: 10)
	}

	func test_success_editContact() async throws {
		let expectation = XCTestExpectation(description: "EditContactEndpoint")

		do {
			let result = try await sut.stubEditUser()

			XCTAssertEqual(result.firstName.orEmpty(), "test")
			XCTAssertEqual(result.lastName.orEmpty(), "unit")
			expectation.fulfill()
		} catch {
			XCTFail(error.localizedDescription)
		}

		wait(for: [expectation], timeout: 10)
	}

	func test_notFound_listUser() async throws {
		let expectation = XCTestExpectation(description: "FailedUserListEndpointSuccess")

		do {
			let _ = try await sut.stubNotFoundListUser()

			XCTFail("Unexpected result")
		} catch {
			XCTAssertNotNil(error)
			expectation.fulfill()
		}

		wait(for: [expectation], timeout: 10)
	}

	func test_notFound_singleUser() async throws {
		let expectation = XCTestExpectation(description: "FailedSingleUserEndpointSuccess")

		do {
			let _ = try await sut.stubNotFoundSingleUser()

			XCTFail("Unexpected result")
		} catch {
			XCTAssertNotNil(error)
			expectation.fulfill()
		}

		wait(for: [expectation], timeout: 10)
	}

	func test_notFound_editUser() async throws {
		let expectation = XCTestExpectation(description: "FailedEditUserEndpointSuccess")

		do {
			let _ = try await sut.stubNotFoundEditUser()

			XCTFail("Unexpected result")
		} catch {
			XCTAssertNotNil(error)
			expectation.fulfill()
		}

		wait(for: [expectation], timeout: 10)
	}

	func test_notFound_addContact() async throws {
		let expectation = XCTestExpectation(description: "FailedAddUserEndpointSuccess")

		do {
			let _ = try await sut.stubNotFoundCreateUser()

			XCTFail("Unexpected result")
		} catch {
			XCTAssertNotNil(error)
			expectation.fulfill()
		}

		wait(for: [expectation], timeout: 10)
	}
}
