//
//  UserContacts.swift
//  Contact
//
//  Created by Gus Adi on 27/04/22.
//

import Foundation

struct UserListResponse: Codable {
	let page: UInt?
	let perPage: UInt?
	let total: UInt?
	let totalPages: UInt?
	let data: [UserData]?
}

struct UserData: Codable {
	let id: UInt?
	let email: String?
	let firstName: String?
	let lastName: String?
	let avatar: String?
}
