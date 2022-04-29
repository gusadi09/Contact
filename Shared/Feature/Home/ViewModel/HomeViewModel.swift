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
	@Published var sectionedDict: Dictionary<String, [UserData]> = [:]
	@Published var error = ""
	@Published var isError = false
	@Published var isLoading = false

	init(userRepository: UsersRepository = UsersDefaultRepository()) {
		self.userRepository = userRepository
	}

	@MainActor func onStartFetch() {
		self.isError = false
		self.error = ""
		self.isLoading = true
	}

	func getSectionedDictionary() -> Dictionary <String , [UserData]> {
		let sectionDictionary: Dictionary<String, [UserData]> = {
			return Dictionary(grouping: userLists.unique(), by: {
				let name = $0.firstName.orEmpty()
				let normalizedName = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
				let firstChar = String(normalizedName.first.orEmpty()).uppercased()
				return firstChar
			})
		}()
		return sectionDictionary
	}

	@MainActor func getUsersList() async {

		onStartFetch()

		do {

			let response = try await userRepository.provideGetUsersList(page: page)

			self.isLoading = false

			self.userLists += response.data ?? []
			self.sectionedDict = getSectionedDictionary()
		} catch {
			self.isLoading = false
			self.isError = true
			self.error = error.localizedDescription
		}
	}

	func onLoadContact() {
		Task {
			await getUsersList()
		}
	}
}
