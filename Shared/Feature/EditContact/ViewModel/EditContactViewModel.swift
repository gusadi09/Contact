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
}
