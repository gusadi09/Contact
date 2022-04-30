//
//  UsersDefaultLocalDataSource.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import Foundation
import CoreData

final class UsersDefaultLocalDataSource: UsersLocalDataSource {

	private let container: NSPersistentContainer

	init(container: NSPersistentContainer = PersistenceController.shared.container) {
		self.container = container
	}

	func saveToLocalContactList(by contact: UserData) throws {
		let entity = Contact(context: container.viewContext)

		entity.id = Int64(contact.id.orZero())
		entity.firstName = contact.firstName.orEmpty()
		entity.lastName = contact.lastName.orEmpty()
		entity.avatar = contact.avatar.orEmpty()

		if container.viewContext.hasChanges {
			try container.viewContext.save()
		}
	}

	func saveEditContact(user: Contact, editedUser: CreateResponse) throws {

		let fetcher: NSFetchRequest<Contact> = Contact.fetchRequest()
		let fetchRequest = try container.viewContext.fetch(fetcher)

		guard let items = fetchRequest.filter({ value in
			value.id == user.id
		}).first else {
			print("Not Found")
			return
		}

		items.firstName = editedUser.firstName.orEmpty()
		items.lastName = editedUser.lastName.orEmpty()
		items.id = user.id
		items.avatar = user.avatar.orEmpty()

		try container.viewContext.save()
	}

	func saveToLocalContactList(with contact: LocalAddedContact) throws {
		let entity = Contact(context: container.viewContext)

		entity.id = contact.id
		entity.firstName = contact.firstName
		entity.lastName = contact.lastName
		entity.avatar = contact.avatar

		if container.viewContext.hasChanges {
			try container.viewContext.save()
		}
	}

	func saveLocalCreate(by contact: CreateResponse) throws {
		let entity = LocalAddedContact(context: container.viewContext)

		entity.id = Int64(contact.id.orEmpty()) ?? 0
		entity.firstName = contact.firstName.orEmpty()
		entity.lastName = contact.lastName.orEmpty()
		entity.avatar = "https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg"

		if container.viewContext.hasChanges {
			try container.viewContext.save()
		}
	}

	func loadLocalContact() async throws -> [Contact] {
		return try await withCheckedThrowingContinuation({ continuation in
			do {
				let fetchRequest = try container.viewContext.fetch(Contact.fetchRequest())

				continuation.resume(returning: fetchRequest)
			} catch {
				continuation.resume(throwing: error)
			}
		})
	}

	func loadCreatedContact() async throws -> [LocalAddedContact] {
		return try await withCheckedThrowingContinuation({ continuation in
			do {
				let fetchRequest = try container.viewContext.fetch(LocalAddedContact.fetchRequest())

				continuation.resume(returning: fetchRequest)
			} catch {
				continuation.resume(throwing: error)
			}
		})
	}

	func deleteLocalItem() throws {
		Task.init {
			let item = try await loadLocalContact()

			for item in item {
				container.viewContext.delete(item)
			}
		}

		if container.viewContext.hasChanges {
			try container.viewContext.save()
		}
	}
}
