//
//  UsersRemoteDataSource.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

protocol UsersRemoteDataSource {
	func getUsersList(page: UInt) async throws -> UserListResponse
	func getSingleUser(by userId: UInt) async throws -> UserData
}
