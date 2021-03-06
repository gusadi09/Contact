//
//  UsersHelper.swift
//  Tests iOS
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation
import Moya
@testable import Contact

final class UsersHelper {
	private let stubProvider = MoyaProvider<UsersTargetType>(stubClosure: MoyaProvider.delayedStub(1.0), plugins: [NetworkLoggerPlugin()])

	private let endpointClosureError = { (target: UsersTargetType) -> Endpoint in
		return Endpoint(
			url: URL(target: target).absoluteString,
			sampleResponseClosure: {
				.networkResponse(404, Data())
			},
			method: target.method,
			task: target.task,
			httpHeaderFields: target.headers
		)
	}

	private var errorStubProvider: MoyaProvider<UsersTargetType> {
		return MoyaProvider<UsersTargetType>(endpointClosure: endpointClosureError, stubClosure: MoyaProvider.delayedStub(2.0))
	}

	func stubGetListUser() async throws -> UserListResponse {
		try await stubProvider.asyncRequest(.getListUsers(1), model: UserListResponse.self)
	}

	func stubCreateUser() async throws -> CreateResponse {
		let body = UserBody(firstName: "test", lastName: "unit")
		return try await stubProvider.asyncRequest(.createUser(body), model: CreateResponse.self)
	}

	func stubGetSingleUser() async throws -> UserData {
		try await stubProvider.asyncRequest(.getSingleUser(1), model: UserData.self)
	}

	func stubEditUser() async throws -> CreateResponse {
		let body = UserBody(firstName: "test", lastName: "unit")
		return try await stubProvider.asyncRequest(.updateUser(1, body), model: CreateResponse.self)
	}

	func stubNotFoundListUser() async throws -> UserListResponse {
		try await errorStubProvider.asyncRequest(.getListUsers(1), model: UserListResponse.self)
	}

	func stubNotFoundSingleUser() async throws -> UserData {
		try await errorStubProvider.asyncRequest(.getSingleUser(0), model: UserData.self)
	}

	func stubNotFoundCreateUser() async throws -> CreateResponse {
		let body = UserBody(firstName: "test", lastName: "unit")
		return try await errorStubProvider.asyncRequest(.createUser(body), model: CreateResponse.self)
	}

	func stubNotFoundEditUser() async throws -> CreateResponse {
		let body = UserBody(firstName: "test", lastName: "unit")
		return try await errorStubProvider.asyncRequest(.updateUser(1, body), model: CreateResponse.self)
	}
}
