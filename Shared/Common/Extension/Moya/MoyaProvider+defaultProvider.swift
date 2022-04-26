//
//  MoyaProvider+defaultProvider.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 26/04/22.
//

import Foundation
import Moya

extension MoyaProvider {
	static func defaultProvider() -> MoyaProvider {
		return MoyaProvider(plugins: [NetworkLoggerPlugin()])
	}
}
