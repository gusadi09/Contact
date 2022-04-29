//
//  UsersDefaultRepository.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

final class UsersDefaultRepository: UsersRepository {

	private let remote: UsersRemoteDataSource
	private let local: UsersLocalDataSource

	init(
		remote: UsersRemoteDataSource = UsersDefaultRemoteDataSource(),
		local: UsersLocalDataSource = UsersDefaultLocalDataSource()
	) {
		self.remote = remote
		self.local = local
	}

	func provideLoadCreatedContact() async throws -> [LocalAddedContact] {
		try await self.local.loadCreatedContact()
	}

	func provideSaveToLocalContactList(with contact: LocalAddedContact) throws {
		try self.local.saveToLocalContactList(with: contact)
	}

	func provideSaveLocalCreate(by contact: CreateResponse) throws {
		try self.local.saveLocalCreate(by: contact)
	}

	func provideGetUsersList(page: UInt) async throws -> UserListResponse {
		return try await self.remote.getUsersList(page: page)
	}

	func provideGetSingleUser(by userId: UInt) async throws -> SingleUserResponse {
		try await self.remote.getSingleUser(by: userId)
	}

	func provideAddContact(with body: UserBody) async throws -> CreateResponse {
		try await self.remote.addContact(with: body)
	}

	func provideLoadLocalContact() async throws -> [Contact] {
		try await self.local.loadLocalContact()
	}

	func provideSaveLocalContact(by user: UserData) throws {
		try self.local.saveToLocalContactList(by: user)
	}

	func provideDeleteLocalItem() throws {
		try self.local.deleteLocalItem()
	}
}
