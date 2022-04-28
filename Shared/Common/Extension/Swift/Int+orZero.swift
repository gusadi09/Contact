//
//  Int+orZero.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

extension Optional where Wrapped == Int {
	func orZero() -> Int {
		return self ?? 0
	}
}
