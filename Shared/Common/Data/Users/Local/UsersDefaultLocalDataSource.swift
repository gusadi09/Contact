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
