//
//  String+orEmpty.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

extension Optional where Wrapped == String {
	func orEmpty() -> String {
		return self ?? ""
	}
}
