//
//  UsersRepository.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

protocol UsersRepository{
	func provideGetUsersList(page: UInt) async throws -> UserListResponse
	func provideGetSingleUser(by userId: UInt) async throws -> SingleUserResponse
	func provideAddContact(with body: UserBody) async throws -> CreateResponse
}
