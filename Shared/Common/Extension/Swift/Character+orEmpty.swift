//
//  Character+orEmpty.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import Foundation

extension Optional where Wrapped == Character {
	func orEmpty() -> Character {
		return self ?? " "
	}
}
