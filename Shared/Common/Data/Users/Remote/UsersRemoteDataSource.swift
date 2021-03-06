//
//  UsersRemoteDataSource.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

protocol UsersRemoteDataSource {
	func getUsersList(page: UInt) async throws -> UserListResponse
	func getSingleUser(by userId: UInt) async throws -> SingleUserResponse
	func addContact(with body: UserBody) async throws -> CreateResponse
	func editContact(in id: UInt, with body: UserBody) async throws -> CreateResponse
}
