//
//  ContactDetailViewModel.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import Foundation

final class ContactDetailViewModel: ObservableObject {
	
	private let userRepository: UsersRepository
	
	@Published var user: SingleUserResponse?
	@Published var isLoading = false
	@Published var isError = false
	@Published var error = ""
	
	init(userRepository: UsersRepository = UsersDefaultRepository()) {
		self.userRepository = userRepository
	}
	
	@MainActor func onStartFetch() {
		self.isError = false
		self.error = ""
		self.isLoading = true
	}
	
	func getUsers(by userId: UInt) async {
		
		await onStartFetch()
		
		do {
			
			let response = try await userRepository.provideGetSingleUser(by: userId)
			
			DispatchQueue.main.async {
				self.isLoading = false
				
				self.user = response
			}
			
		} catch {
			self.isLoading = false
			self.isError = true
			self.error = error.localizedDescription
		}
	}
	
	func onLoadUser(by userId: UInt) {
		Task {
			await getUsers(by: userId)
		}
	}
}
