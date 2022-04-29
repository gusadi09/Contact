//
//  UsersDefaultRemoteDataSource.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation
import Moya

final class UsersDefaultRemoteDataSource: UsersRemoteDataSource {

	private let provider: MoyaProvider<UsersTargetType>

	init(provider: MoyaProvider<UsersTargetType> = .defaultProvider()) {
		self.provider = provider
	}

	func getUsersList(page: UInt) async throws -> UserListResponse {
		try await self.provider.asyncRequest(.getListUsers(page), model: UserListResponse.self)
	}

	func getSingleUser(by userId: UInt) async throws -> UserData {
		try await self.provider.asyncRequest(.getSingleUser(userId), model: UserData.self)
	}
}
