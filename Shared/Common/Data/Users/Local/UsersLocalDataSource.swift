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
	func loadLocalContact() async throws -> [Contact]
	func deleteLocalItem() throws
}
