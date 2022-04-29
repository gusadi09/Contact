//
//  UsersDefaultRepository.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

final class UsersDefaultRepository: UsersRepository {

	private let remote: UsersRemoteDataSource

	init(remote: UsersRemoteDataSource = UsersDefaultRemoteDataSource()) {
		self.remote = remote
	}

	func provideGetUsersList(page: UInt) async throws -> UserListResponse {
		try await self.remote.getUsersList(page: page)
	}

	func provideGetSingleUser(by userId: UInt) async throws -> SingleUserResponse {
		try await self.remote.getSingleUser(by: userId)
	}

	func provideAddContact(with body: UserBody) async throws -> CreateResponse {
		try await self.remote.addContact(with: body)
	}
}
