//
//  UsersLocalDataSource.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import Foundation
import CoreData

protocol UsersLocalDataSource {
	func saveToLocalContactList(by contact: UserData) throws
	func saveToLocalContactList(with contact: LocalAddedContact) throws
	func saveLocalCreate(by contact: CreateResponse) throws
	func loadLocalContact() async throws -> [Contact]
	func loadCreatedContact() async throws -> [LocalAddedContact]
	func deleteLocalItem() throws
	func saveEditContact(user: Contact, editedUser: CreateResponse) throws
}
