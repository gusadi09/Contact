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

	enum CodingKeys: String, CodingKey {
		case page, total, data
		case perPage = "per_page"
		case totalPages = "total_pages"
	}
}

struct SingleUserResponse: Codable {
	let data: UserData?
}

struct UserData: Codable, Hashable {
	let id: UInt?
	let email: String?
	let firstName: String?
	let lastName: String?
	let avatar: String?

	enum CodingKeys: String, CodingKey {
		case id, email, avatar
		case firstName = "first_name"
		case lastName = "last_name"
	}

	static func == (lhs: UserData, rhs: UserData) -> Bool {
		lhs.id.orZero() == rhs.id.orZero()
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id.orZero())
	}
}

struct UserBody: Codable {
	var firstName: String
	var lastName: String

	enum CodingKeys: String, CodingKey {
		case firstName = "first_name"
		case lastName = "last_name"
	}
}
