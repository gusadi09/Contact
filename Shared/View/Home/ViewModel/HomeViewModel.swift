//
//  HomeViewModel.swift
//  Contact
//
//  Created by Gus Adi on 27/04/22.
//

import Foundation

final class HomeViewModel: ObservableObject {

	private let userRepository: UsersRepository

	@Published var page: UInt = 1
	@Published var userLists = [UserData]()

	init(userRepository: UsersRepository = UsersDefaultRepository()) {
		self.userRepository = userRepository
	}

	@MainActor func getUsersList() async {
		do {

			let response = try await userRepository.provideGetUsersList(page: page)

			self.userLists += response.data ?? []
		} catch {
			print(error.localizedDescription)
		}
	}

	func onLoadContact() {
		Task {
			await getUsersList()
		}
	}
}
