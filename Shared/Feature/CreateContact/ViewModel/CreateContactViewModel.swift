//
//  CreateContactViewModel.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import Foundation

final class CreateContactViewModel: ObservableObject {

	private let repository: UsersRepository

	@Published var body = UserBody(firstName: "", lastName: "")

	@Published var isLoading = false
	@Published var isError = false
	@Published var error = ""
	@Published var success = false

	init(repository: UsersRepository = UsersDefaultRepository()) {
		self.repository = repository
	}

	@MainActor func onStartFetch() {
		self.isError = false
		self.error = ""
		self.isLoading = true
		self.success = false
	}

	func addContact() async {

		await onStartFetch()

		do {

			let response = try await repository.provideAddContact(with: body)

			try self.repository.provideSaveLocalCreate(by: response)

			DispatchQueue.main.async {
				self.isLoading = false
				self.success = true
			}

		} catch {
			DispatchQueue.main.async {
				self.isLoading = false
				self.isError = true
				self.error = error.localizedDescription
			}

		}
	}

	func isDisable() -> Bool {
		body.firstName.isEmpty
	}

	func onSaveContact() {
		Task {
			await addContact()
		}
	}
}
