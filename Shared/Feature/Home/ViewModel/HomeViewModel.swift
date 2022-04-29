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
	@Published var userLists = [Contact]()
	@Published var sectionedDict: Dictionary<String, [Contact]> = [:]
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

	func getSectionedDictionary() -> Dictionary <String , [Contact]> {
		let sectionDictionary: Dictionary<String, [Contact]> = {
			return Dictionary(grouping: userLists, by: {
				let name = $0.firstName.orEmpty()
				let normalizedName = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
				let firstChar = String(normalizedName.first.orEmpty()).uppercased()
				return firstChar
			})
		}()
		return sectionDictionary
	}

	func deleteItem() async {
		do {
			try userRepository.provideDeleteLocalItem()
		} catch {
			self.isLoading = false
			self.isError = true
			self.error = error.localizedDescription
		}
	}

	func loadLocalList() async {

		do {
			let data = try await userRepository.provideLoadLocalContact()

			DispatchQueue.main.async {
				self.userLists += data.unique()

				self.sectionedDict = self.getSectionedDictionary()
			}

		} catch {
			DispatchQueue.main.async {
				self.isLoading = false
				self.isError = true
				self.error = error.localizedDescription
			}

		}
	}

	func getUsersList() async {

		await onStartFetch()

		do {

			let response = try await userRepository.provideGetUsersList(page: page)

			for item in response.data ?? [] {
				try self.userRepository.provideSaveLocalContact(by: item)
			}
			
			DispatchQueue.main.async {
				self.isLoading = false
			}

		} catch {
			DispatchQueue.main.async {
				self.isLoading = false
				self.isError = true
				self.error = error.localizedDescription
			}

		}
	}

	func loadCreatedList() async {
		do {
			let data = try await userRepository.provideLoadCreatedContact()

			for item in data {
				try self.userRepository.provideSaveToLocalContactList(with: item)
			}

		} catch {
			DispatchQueue.main.async {
				self.isLoading = false
				self.isError = true
				self.error = error.localizedDescription
			}

		}
	}

	func onLoadContact() {
		Task {
			if self.userLists.isEmpty {
				DispatchQueue.main.async {
					self.userLists = []
					self.page = 1
				}

				await deleteItem()
				await getUsersList()
				await loadCreatedList()
			}

			await loadLocalList()
		}
	}
}
