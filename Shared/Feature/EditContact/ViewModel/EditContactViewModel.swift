//
//  EditContactViewModel.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import Foundation

final class EditContactViewModel: ObservableObject {

	private let repository: UsersRepository

	@Published var body = UserBody(firstName: "", lastName: "")

	@Published var isLoading = false
	@Published var isError = false
	@Published var error = ""
	@Published var success = false

	init(repository: UsersRepository = UsersDefaultRepository()) {
		self.repository = repository
	}

	func onScreenAppear(user: Contact) {
		self.body.firstName = user.firstName.orEmpty()
		self.body.lastName = user.lastName.orEmpty()
	}

	@MainActor func onStartFetch() {
		self.isError = false
		self.error = ""
		self.isLoading = true
		self.success = false
	}

	func saveEditedContact(user: Contact) async {

		await onStartFetch()

		do {

			let response = try await repository.provideEditContact(in: UInt(user.id), with: body)

			try repository.provideSaveLocalEditContact(user: user, editedUser: response)

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

	func saveEditing(user: Contact) {
		Task {
			await saveEditedContact(user: user)
		}
	}
}
