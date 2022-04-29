//
//  UInt+orZero.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation

extension Optional where Wrapped == UInt {
	func orZero() -> UInt {
		return self ?? 0
	}
}
